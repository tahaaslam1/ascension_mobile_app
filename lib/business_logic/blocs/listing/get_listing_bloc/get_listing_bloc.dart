import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../models/listing.dart';

part 'get_listing_event.dart';
part 'get_listing_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GetListingBloc extends Bloc<GetListingEvent, GetListingState> {
  final ListingRepository _listingRepository;

  GetListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(const GetListingState()) {
    on<ListingFetched>(
      _onListingFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onListingFetched(ListingFetched event, Emitter<GetListingState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == GetListingStatus.initial) {
        final listings = await _listingRepository.getListing();

        return emit(state.copyWith(
          status: GetListingStatus.success,
          listings: listings,
          hasReachedMax: false,
        ));
      }

      final listings = await _listingRepository.getListing(state.listings.length);
      listings.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: GetListingStatus.success,
              listings: List.of(state.listings)..addAll(listings),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: GetListingStatus.failure));
    }
  }
}

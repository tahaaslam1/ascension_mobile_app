import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'single_listing_event.dart';
part 'single_listing_state.dart';

class SingleListingBloc extends Bloc<SingleListingEvent, SingleListingState> {
  final ListingRepository _listingRepository;

  SingleListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(const SingleListingState()) {
    on<FetchSingleListing>((event, emit) async {
      try {
        emit(state.copyWith(getSingleListingStatus: GetSingleListingStatus.loading));

        Listing listing = await _listingRepository.getSingleListing(listingId: event.listingId);

        emit(state.copyWith(getSingleListingStatus: GetSingleListingStatus.loaded, listing: listing));
      } on DioError catch (_) {
        emit(state.copyWith(getSingleListingStatus: GetSingleListingStatus.error));
      }
    });

    on<DeleteSingleListing>(((event, emit) async {
      try {
        emit(state.copyWith(deleteSingleListingStatus: DeleteSingleListingStatus.loading));

        await _listingRepository.deleteSingleListing(listingId: event.listingId);

        emit(state.copyWith(deleteSingleListingStatus: DeleteSingleListingStatus.deleted));
        // _listingRepository.deleteListing(listingId: event.listingId);

        // emit(state.copyWith(deleteSingleListingStatus: DeleteSingleListingStatus.deleted)
      } on DioError catch (_) {
        emit(state.copyWith(deleteSingleListingStatus: DeleteSingleListingStatus.error));
      }
    }));
  }
}

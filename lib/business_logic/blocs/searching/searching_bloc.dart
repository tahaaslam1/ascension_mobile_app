import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/listing_repository/listing_repository.dart';
import '../../../logger.dart';
import '../../../models/listing.dart';

part 'searching_event.dart';
part 'searching_state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  final ListingRepository _listingRepository;
  SearchingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(const SearchingState()) {
    on<FetchSearchedListing>((event, emit) async {
      try {
        emit(state.copyWith(getSearchingStatus: GetSearchingStatus.loading));
        if (event.listingTitle.isEmpty) {
          emit(state.copyWith(getSearchingStatus: GetSearchingStatus.loaded, listings: []));
        } else {
          Map<String, dynamic> _filter = {
            'industries': event.industries,
            'city': event.city?.id,
            'price_start': event.priceRangeStart,
            'price_end': event.priceRangeEnd,
            'is_auctioned': event.isAuctioned,
            'is_established': event.isEstablished,
          };
          logger.w(_filter);
          List<Listing> listing = await _listingRepository.getSearchedListing(listingTitle: event.listingTitle, filter: _filter);
          emit(state.copyWith(getSearchingStatus: GetSearchingStatus.loaded, listings: listing));
        }
      } on DioError catch (_) {
        emit(state.copyWith(getSearchingStatus: GetSearchingStatus.error));
      }
    });
  }
}

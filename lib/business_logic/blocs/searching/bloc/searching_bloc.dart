import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/listing_repository/listing_repository.dart';
import '../../../../models/listing.dart';

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
          List<Listing> listing = await _listingRepository.getSearchedListing(listingTitle: event.listingTitle);
          emit(state.copyWith(getSearchingStatus: GetSearchingStatus.loaded, listings: listing));
        }
      } on Failure catch (_) {
        emit(state.copyWith(getSearchingStatus: GetSearchingStatus.error));
      }
    });
  }
}

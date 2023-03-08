import 'dart:convert';

import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../logger.dart';
import '../../../../models/listing.dart';

part 'get_listing_event.dart';
part 'get_listing_state.dart';

class GetListingBloc extends Bloc<GetListingEvent, GetListingState> {
  final ListingRepository _listingRepository;

  GetListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(GetListingInitial()) {
    on<FetchLisiting>(_onFetchListing);
  }
  void _onFetchListing(FetchLisiting event, Emitter<GetListingState> emit) async {
    emit(GetListingLoadingState());
    try {
      final offset = event.offset;
      List<Listing> listing = await _listingRepository.getListing(offset: offset);
      logger.wtf(listing);
      emit(GetListingLoadedState(listings: listing));
    } on DioError catch (error) {
      emit(GetListingErrorState(errorMessage: DioExceptions.fromDioError(error).toString()));
      logger.e(error.message);
    }
  }
}

import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_recommended_listing_event.dart';
part 'get_recommended_listing_state.dart';

class GetRecommendedListingBloc extends Bloc<GetRecommendedListingEvent, GetRecommendedListingState> {
  final ListingRepository _listingRepository;

  GetRecommendedListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(GetRecommendedListingInitial()) {
    on<FetchSingleRecommendedListing>((event, emit) async {
      emit(GetRecommendedListingInitial());

      try {
        emit(GetRecommendedListingLoading());
        List<Listing> listings = []; //TODO : update
        // List<Listing> listings = await _listingRepository.getRecommendedListings(niche: event.industry);

        emit(GetRecommendedListingLoaded(listings: listings));
      } on DioError catch (error) {
        emit(GetRecommendedListingError(errorMessage: DioExceptions.fromDioError(error).toString()));
      }
    });
  }
}

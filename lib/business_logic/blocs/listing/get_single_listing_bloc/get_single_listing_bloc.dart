import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_single_listing_event.dart';
part 'get_single_listing_state.dart';

class GetSingleListingBloc extends Bloc<GetSingleListingEvent, GetSingleListingState> {
  final ListingRepository _listingRepository;

  GetSingleListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(GetSingleListingInitial()) {
    on<FetchSingleListing>((event, emit) async {
      emit(GetSingleListingInitial());

      try {
        emit(GetSingleListingLoading());

        Listing listing = await _listingRepository.getSingleListing(listingId: event.listingId);

        emit(GetSingleListingLoaded(listing: listing));
      } on DioError catch (error) {
        emit(GetSingleListingError(errorMessage: DioExceptions.fromDioError(error).toString()));
      }
    });
  }
}

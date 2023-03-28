import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_auctioned_listing_event.dart';
part 'get_auctioned_listing_state.dart';

class GetAuctionedListingBloc extends Bloc<GetAuctionedListingEvent, GetAuctionedListingState> {
  final ListingRepository _listingRepository;

  GetAuctionedListingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(GetAuctionedListingInitial()) {
    on<FetchAuctionedListing>(_onFetchAuctionedListing);
  }

  Future<void> _onFetchAuctionedListing(FetchAuctionedListing event, Emitter<GetAuctionedListingState> emit) async {
    try {
      List<Listing> auctionedListings = await _listingRepository.getAuctionedListing();
      emit(GetAuctionedListingLoaded(auctionedListings: auctionedListings));
    } on DioError catch (e) {
      logger.e(e);
      emit(GetAuctionedListingError(errorMessage: DioExceptions.fromDioError(e).toString()));
    }
  }
}

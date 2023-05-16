import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_seller_listing_event.dart';
part 'get_seller_listing_state.dart';

class GetSellerListingBloc extends Bloc<GetSellerListingEvent, GetSellerListingState> {
  final UserRepository _userRepository;
  final ListingRepository _listingRepository;

  GetSellerListingBloc({required ListingRepository listingRepository, required UserRepository userRepository})
      : _listingRepository = listingRepository,
        _userRepository = userRepository,
        super(GetSellerListingInitial()) {
    on<FetchSellerListing>(_onFetchSellerListing);
  }

  Future<void> _onFetchSellerListing(FetchSellerListing event, Emitter<GetSellerListingState> emit) async {
    emit(GetSellerListingInitial());
    try {
      User? user = _userRepository.getLoggedInUser;

      List<Listing> sellerListings = await _listingRepository.getSellerListing(sellerId: user!.userId);

      emit(GetSellerListingLoaded(sellerListings: sellerListings));
    } on Failure catch (e) {
      logger.e(e);
      emit(GetSellerListingError(errorMessage: e.message));
    }
  }
}

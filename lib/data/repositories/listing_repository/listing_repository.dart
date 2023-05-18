import 'package:ascension_mobile_app/models/listing.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/bids.dart';

abstract class ListingRepository {
  Future<List<Listing>> getListing([int startIndex = 0]);

  Future<List<Listing>> getAuctionedListing();

  Future<List<Listing>> getSellerListing({required String? sellerId});

  Future<void> createListing({required Map<String, dynamic> listingFormData, required List<XFile> listingImages, required String? sellerId});

  Future<Listing> getSingleListing({required String listingId});

  Future<List<Listing>> getRecommendedListings({required String? niche});

  Future<List<Listing>> getSearchedListing({required String listingTitle, required Map<String, dynamic> filter});

  Future<void> deleteSingleListing({required String listingId});

  Future<bool> addtoFavourite({required Listing listData});

  Future<void> getFavouriteListing();


    Future<void> placeBid({required String buyerId, required String sellerId, required int bidValue, required listingId});

  Future<Bids> getBidDetail ({required String listingId});

  Future<List<Bids>> fetchAllBids({required String listingId});

  
  Future<void> updateListing({required String listingId, required Map<String, dynamic> data});


  List<Listing> get favouriteListing;
}

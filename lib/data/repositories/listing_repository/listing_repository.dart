import 'dart:ffi';

import 'package:ascension_mobile_app/models/listing.dart';
import 'package:image_picker/image_picker.dart';

abstract class ListingRepository {
  Future<List<Listing>> getListing([int startIndex = 0]);

  Future<List<Listing>> getAuctionedListing();

  Future<List<Listing>> getSellerListing({required String? sellerId});

  Future<void> createListing({required Map<String, dynamic> listingFormData, required List<XFile> listingImages, required String? sellerId});

  Future<Listing> getSingleListing({required String listingId});

  Future<List<Listing>> getRecommendedListings({required String? niche});

  Future<void> deleteSingleListing({required String listingId});

  Future<bool> addtoFavourite({required Listing listData});

  Future<void> getFavouriteListing();

  List<Listing> get favouriteListing;
}

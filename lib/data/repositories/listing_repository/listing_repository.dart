import 'dart:ffi';

import 'package:image_picker/image_picker.dart';

import '../../../models/listing.dart';

abstract class ListingRepository {
  Future<void> createListing(
      {required Map<String, dynamic> listingFormData,
      required List<XFile> listingImages,
      required String? sellerId});
  Future<List<Listing>> getListing({required int offset});
}

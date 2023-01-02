import 'package:image_picker/image_picker.dart';

abstract class ListingRepository {
  Future<void> createListing({required Map<String, dynamic> listingFormData, required List<XFile> listingImages, required String? sellerId});
}

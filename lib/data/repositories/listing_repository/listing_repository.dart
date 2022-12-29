abstract class ListingRepository {
  Future<void> createListing({required Map<String, dynamic> listingFormData, required String? sellerId});
}

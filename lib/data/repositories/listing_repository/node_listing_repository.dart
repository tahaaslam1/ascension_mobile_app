import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';

class NodeListingRepository extends ListingRepository {
  final HTTPClient httpClient;

  NodeListingRepository({required this.httpClient});

  @override
  Future<void> createListing({required Map<String, dynamic> listingFormData, required List<XFile> listingImages, required String? sellerId}) async {
    final String endpoint = '/createListing/$sellerId';

    final List<String> uploadedImages = await _uploadListingImagesOnCloudinary(listingImages);

    logger.wtf('done');

    final Map<String, dynamic> listingData = _reFormatForm(listingFormData, uploadedImages);

    logger.i(listingData);

    final Response response = await httpClient.post(endpoint, data: listingData);

    logger.wtf('Listing Created Successfully: $response');
  }

  Future<List<String>> _uploadListingImagesOnCloudinary(List<XFile> selectedImages) async {
    List<String> uploadedImages = [];
    final cloudinary = CloudinaryPublic(cloudinaryCloudName, cloudinaryUploadPreset, cache: false);

    if (selectedImages.isNotEmpty) {
      for (var image in selectedImages) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, resourceType: CloudinaryResourceType.Image),
        );

        uploadedImages.add(response.secureUrl);
      }
    }

    return uploadedImages;
  }

  Map<String, dynamic> _reFormatForm(Map<String, dynamic> listingFormData, List<String> uploadedImages) {
    return {
      'title': listingFormData['title'].trim(),
      'headline': listingFormData['headline'].trim(),
      'is_auctioned': listingFormData['isAuctioned'],
      'is_established': listingFormData['isEstablished'],
      'location': listingFormData['location'].id,
      'description': listingFormData['description'].trim(),
      'reason_for_selling': listingFormData['reasonForSelling'].trim(),
      'industry': listingFormData['industry'].id,
      'price': {
        'asking_price': double.parse(listingFormData['askingPrice']),
        'net_income': double.parse(listingFormData['netIncome']),
        'cash_flow': double.parse(listingFormData['cashFlow']),
        'gross_revenue': double.parse(listingFormData['grossRevenue']),
        'inventory_price': double.tryParse((listingFormData['inventoryPrice']) ?? ('0')),
        'ebitda': double.tryParse((listingFormData['ebitda']) ?? ('0'))
      },
      'images': uploadedImages
    };
  }

  @override
  Future<Listing> getSingleListing({required String listingId}) async {
    Listing listing;

    String endpoint = '/getSingleListing/$listingId';

    final Response response = await httpClient.get(endpoint);

    listing = Listing.fromJson(response.data['data'][0]);
    // logger.wtf(listing);

    logger.wtf('Fetched Listing Data Successfully');
    logger.wtf(response.data['data']);

    return listing;
  }

  @override
  Future<List<Listing>> getRecommendedListings({required String niche}) async {
    List<Listing> listings;

    String endpoint = '/getSimilarListing/$niche';

    final Response response = await httpClient.get(endpoint);

    listings = response.data['data'].map<Listing>((inbox) => Listing.fromJson(inbox)).toList();

    logger.wtf('Fetched Recommended Listing Data Successfully');
    logger.wtf(response.data['data']);

    return listings;
  }
}

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

    final Map<String, dynamic> listingData = _reFormatForm(listingFormData, uploadedImages);

    logger.i(listingData);

    final Response response = await httpClient.post(endpoint, data: listingData);

    logger.wtf('Listing Created Successfully: $response');
  }

  @override
  Future<List<Listing>> getListing([int startIndex = 0]) async {
    const int limit = 10;
    List<Listing> listings = [];
    const String endpoint = '/getInfiniteListing';
    final Response response = await httpClient.get(endpoint, queryParameters: {'start': startIndex, 'limit': limit});

    logger.wtf('Fetched ALl Listing Data Successfully');
    logger.wtf(response.data['data']);
    listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();
    return listings;
  }

  // List<Listing> _parseAuctionedListing(dynamic data) {
  //   return data.map<Listing>((res) => Listing.fromJson(res)).toList();
  // }

  @override
  Future<List<Listing>> getAuctionedListing() async {
    List<Listing> listings = [];
    const String endpoint = '/getAuctionedListing';
    final Response response = await httpClient.get(endpoint);

    logger.wtf('Fetched ALl Listing Data Successfully');
    logger.wtf(response.data['data']);
    // return compute(_parseAuctionedListing, response.data['data']);
    listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();
    return listings;
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
      'is_auctioned': listingFormData['isAuctioned'],
      'is_established': listingFormData['isEstablished'],
      'city': listingFormData['city'].id,
      'description': listingFormData['description'].trim(),
      'reason_for_selling': listingFormData['reasonForSelling'].trim(),
      'industry': listingFormData['industry'].id,
      'price': {
        'asking_price': double.parse(listingFormData['askingPrice']),
        'net_income': double.parse(listingFormData['netIncome']),
        'cash_flow': double.parse(listingFormData['cashFlow']),
        'gross_revenue': double.parse(listingFormData['grossRevenue']),
        'inventory_price': double.tryParse((listingFormData['inventoryPrice']) ?? ('0')),
      },
      'images': uploadedImages,
      'assets': [],
      'opportunities': [],
      'risks': []
    };
  }

  @override
  Future<Listing> getSingleListing({required String listingId}) async {
    Listing listing;

    String endpoint = '/getSingleListing';

    final Response response = await httpClient.get(endpoint, queryParameters: {'id': listingId});

    listing = Listing.fromJson(response.data['data'][0]);

    logger.wtf('Fetched Listing Data Successfully');
    logger.wtf(response.data['data']);

    return listing;
  }

  @override
  Future<List<Listing>> getRecommendedListings({required String? niche}) async {
    List<Listing> listings = [];

    String endpoint = '/getSimilarlisitng';

    final Response response = await httpClient.get(endpoint, queryParameters: {'niche': niche});

    logger.i(response);

    listings = response.data['data'].map<Listing>((inbox) => Listing.fromJson(inbox)).toList();

    logger.wtf('Fetched Recommended Listing Data Successfully');
    logger.wtf(response.data['data']);

    return listings;
  }

  @override
  Future<List<Listing>> getSellerListing({required String? sellerId}) async {
    List<Listing> listings = [];
    const String endpoint = '/seller/getListing';
    final Response response = await httpClient.get(endpoint, queryParameters: {'sellerId': sellerId});

    logger.wtf('Fetched ALl Listing Data Successfully');
    logger.wtf(response.data['data']);

    listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();
    return listings;
  }

  @override
  Future<void> deleteSingleListing({required String listingId}) async {
    String endpoint = '/seller/deleteSellerListing';

    final response = await httpClient.delete(endpoint, queryParameters: {'id': listingId});

    logger.wtf('Deleted Listing Successfully');
  }
}

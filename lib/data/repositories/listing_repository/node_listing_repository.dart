import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../services/local_storage_services.dart';

class NodeListingRepository extends ListingRepository {
  final HttpService httpClient;

  final List<Listing> _favListing = [];

  final LocalStorageService? localStorageService;

  NodeListingRepository({required this.httpClient, required this.localStorageService});

  @override
  Future<void> createListing({required Map<String, dynamic> listingFormData, required List<XFile> listingImages, required String? sellerId}) async {
    final String endpoint = '/createListing/$sellerId';
    try {
      final List<String> uploadedImages = await _uploadListingImagesOnCloudinary(listingImages);

      final Map<String, dynamic> listingData = _reFormatForm(listingFormData, uploadedImages);

      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: listingData);
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<List<Listing>> getListing([int startIndex = 0]) async {
    const int limit = 10;
    List<Listing> listings = [];
    const String endpoint = '/getInfiniteListing';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'start': startIndex, 'limit': limit});

      logger.wtf('Fetched ALl Listing Data Successfully');

      listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();

      return listings;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<List<Listing>> getSearchedListing({required listingTitle, required Map<String, dynamic> filter}) async {
    List<Listing> listings = [];

    const String endpoint = '/getSearchedListing';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, queryParameters: {'title': listingTitle}, data: filter);

      listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();

      return listings;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  // List<Listing> _parseAuctionedListing(dynamic data) {
  //   return data.map<Listing>((res) => Listing.fromJson(res)).toList();
  // }

  @override
  Future<List<Listing>> getAuctionedListing() async {
    List<Listing> listings = [];

    const String endpoint = '/getAuctionedListing';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint);

      logger.wtf('Fetched ALl Listing Data Successfully');
      // return compute(_parseAuctionedListing, response.data['data']);
      listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();

      return listings;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
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

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'id': listingId});

      listing = Listing.fromJson(response.data['data'][0]);

      logger.wtf('Fetched Listing Data Successfully');

      return listing;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<List<Listing>> getRecommendedListings({required String? niche}) async {
    List<Listing> listings = [];

    String endpoint = '/getSimilarlisitng';

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'niche': niche});

      listings = response.data['data'].map<Listing>((inbox) => Listing.fromJson(inbox)).toList();

      logger.wtf('Fetched Recommended Listing Data Successfully');

      return listings;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<List<Listing>> getSellerListing({required String? sellerId}) async {
    List<Listing> listings = [];
    const String endpoint = '/seller/getListing';

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'sellerId': sellerId});

      logger.wtf('Fetched ALl Listing Data Successfully');

      listings = response.data['data'].map<Listing>((res) => Listing.fromJson(res)).toList();

      return listings;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> deleteSingleListing({required String listingId}) async {
    String endpoint = '/seller/deleteSellerListing';
    try {
      await httpClient.request<Map<String, dynamic>>(RequestMethod.delete, endpoint, queryParameters: {'id': listingId});

      logger.wtf('Deleted Listing Successfully');
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<bool> addtoFavourite({required Listing listData}) async {
    try {
      if (_favListing.contains(listData)) {
        _favListing.remove(listData);

        await localStorageService!.removeString('fav_listing');

        final String encodedData = Listing.encode(_favListing);

        await localStorageService!.addString('fav_listing', encodedData);

        // await localStorageService!.removeStringListItem("favourite", stringList);
        return false;
      } else {
        logger.d('false');
        _favListing.add(listData);

        await localStorageService!.removeString('fav_listing');

        final String encodedData = Listing.encode(_favListing);

        await localStorageService!.addString('fav_listing', encodedData);

        return true;
      }
    } catch (_) {
      throw Failure();
    }
  }

  @override
  Future<void> getFavouriteListing() async {
    try {
      final String favListingString = await localStorageService!.getString('fav_listing');

      if (favListingString.isNotEmpty) {
        final List<Listing> fListing = Listing.decode(favListingString);
        _favListing.clear();
        _favListing.addAll(fListing);
      }
    } catch (_) {
      throw Failure();
    }
  }

  Map<String, dynamic> _reFormatEditForm(Map<String, dynamic> listingFormData) {
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
      'images': [],
      'assets': [],
      'opportunities': [],
      'risks': []
    };
  }

  @override
  List<Listing> get favouriteListing => _favListing;

  @override
  Future<void> updateListing({required String listingId, required Map<String, dynamic> data}) async {
    const String endpoint = '/seller/updateListing';

    try {
      final Map<String, dynamic> listingData = _reFormatEditForm(data);
      logger.w(listingData);
      await httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint, data: listingData, queryParameters: {'listing_id': listingId});
    } catch (_) {
      logger.e(_);
      throw Failure();
    }
  }
}

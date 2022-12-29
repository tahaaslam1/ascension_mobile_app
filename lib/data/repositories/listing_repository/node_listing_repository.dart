import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:ascension_mobile_app/networking/endpoints.dart';
import 'package:dio/dio.dart';

class NodeListingRepository extends ListingRepository {
  final HTTPClient httpClient;

  NodeListingRepository({required this.httpClient});

  @override
  Future<void> createListing({required Map<String, dynamic> listingFormData, required String? sellerId}) async {
    final String endpoint = '/createListing/$sellerId';

    final Map<String, dynamic> listingData = _reFormatForm(listingFormData);

    logger.i(listingData);

    final Response response = await httpClient.post(Endpoints.baseUrl + endpoint, data: listingData);

    logger.wtf('Listing Created Successfully: $response');
  }

  Map<String, dynamic> _reFormatForm(Map<String, dynamic> listingFormData) {
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
    };
  }
}

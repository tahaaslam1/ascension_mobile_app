import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/inbox.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:dio/dio.dart';

class NodeChatRepository extends ChatRepository {
  final HttpService httpClient;

  NodeChatRepository({required this.httpClient});

  @override
  Future<List<Inbox>> getInboxes({required String? userId}) async {
    List<Inbox> inboxes = [];

    const String endpoint = '/getInbox';

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {'user_id': userId});

      inboxes = response.data['data'].map<Inbox>((inbox) => Inbox.fromJson(inbox)).toList();

      logger.wtf('Fetched Inboxes successfully');

      return inboxes;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<Map<String, dynamic>> createInbox({required String? buyerId, required String? sellerId, required String title, required String listingId}) async {
    const String endpoint = '/CreateInbox';

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {
        'sender_id': buyerId,
        'receiver_id': sellerId,
        'title': title,
        'listing_id': listingId,
      });

      logger.wtf('Created Inbox successfully');
      logger.d(response.data['data']);

      return response.data['data'][0];
    } on DioError catch (e) {
      // logger.e(e);
      if (e.response!.statusCode == 400) {
        throw Failure3(data: e.response!.data['data'][0]);
      } else {
        throw Failure();
      }
    }
  }
}

import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/inbox.dart';
import 'package:dio/dio.dart';

import '../../../networking/client/http_client.dart';

class NodeChatRepository extends ChatRepository {
  final HTTPClient httpClient;

  NodeChatRepository({required this.httpClient});

  @override
  Future<List<Inbox>> getInboxes({required String? userId}) async {
    List<Inbox> inboxes = [];

    const String endpoint = '/getInbox';

    final Response response = await httpClient.post(endpoint, data: {'user_id': userId});

    inboxes = response.data['data'].map<Inbox>((inbox) => Inbox.fromJson(inbox)).toList();

    logger.wtf('Fetched Inboxes successfully');

    return inboxes;
  }
}

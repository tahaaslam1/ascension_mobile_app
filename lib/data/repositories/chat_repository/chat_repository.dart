import 'package:ascension_mobile_app/models/inbox.dart';

abstract class ChatRepository {
  Future<List<Inbox>> getInboxes({required String? userId});

  Future<Map<String, dynamic>> createInbox({required String? buyerId, required String? sellerId, required String title, required String listingId});
}

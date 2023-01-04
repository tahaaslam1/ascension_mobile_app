import 'package:ascension_mobile_app/models/inbox.dart';

abstract class ChatRepository {
  Future<List<Inbox>> getInboxes({required String? userId});
}

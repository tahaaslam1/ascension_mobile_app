import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';

abstract class CustomException implements Exception {
  final String message;
  CustomException(String eMessage) : message = _parseExceptionMessage(eMessage);

  static String _parseExceptionMessage(String message) {
    String tempMessage = message.toLowerCase();
    List<String> stopWords = ['exception:', 'error:', 'supabase', 'socket'];
    for (String word in stopWords) {
      if (tempMessage.contains(word)) {
        logger.e(message);
        return AppMessageService.genericErrorMessage;
      }
    }
    return message;
  }
}

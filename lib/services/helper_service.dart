import 'package:jwt_decoder/jwt_decoder.dart';

class HelperService {
  static String someHelperFunctions() {
    return 'doAnything';
  }

  static Map<String, dynamic> decodeJwtToken({required String token}) {
    return JwtDecoder.decode(token);
  }
  
}

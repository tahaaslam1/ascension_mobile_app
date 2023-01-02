import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const secureStorage = FlutterSecureStorage();

  static Future<void> storeToken({required key, required token}) async {
    await secureStorage.write(key: key, value: token);
  }

  static Future<String?> getToken(key) async {
    final token = await secureStorage.read(key: key);
    return token;
  }

  static Future<void> removeToken() async {
    await secureStorage.deleteAll();
  }
}

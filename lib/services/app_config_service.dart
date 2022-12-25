import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigService {
  late SharedPreferences _prefs;
  late bool firstLauch;
  static final AppConfigService instance = AppConfigService._internal();
  AppConfigService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final getIt = GetIt.instance;
    firstLauch = _prefs.getBool('firstLauch') ?? true;
    if (firstLauch) {
      await _prefs.setBool('firstLauch', false);
    }

    getIt.registerSingleton(Dio());
    getIt.registerSingleton(HTTPClient(getIt<Dio>()));

  }
}

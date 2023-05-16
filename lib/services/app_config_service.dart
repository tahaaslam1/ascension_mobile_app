import 'package:shared_preferences/shared_preferences.dart';

class AppConfigService {
  late SharedPreferences _prefs;
  late bool firstLauch;
  static final AppConfigService instance = AppConfigService._internal();
  AppConfigService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    firstLauch = _prefs.getBool('firstLauch') ?? true;
    if (firstLauch) {
      await _prefs.setBool('firstLauch', false);
    }
  }
}

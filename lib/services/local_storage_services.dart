import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  SharedPreferences? _preferences;

  Future<void> _init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> addStringListItem(String key, String value) async {
    await _init();
    List<String> items = _preferences!.getStringList(key) ?? [];
    items.add(value);
    await _preferences!.setStringList(key, items);
  }

  Future<void> removeStringListItem(String key, String value) async {
    await _init();
    List<String> items = _preferences!.getStringList(key) ?? [];
    items.remove(value);
    await _preferences!.setStringList(key, items);
  }

  Future<List<String>> getStringList(String key) async {
    await _init();
    return _preferences!.getStringList(key) ?? [];
  }

  Future<void> addString(String key, String value) async {
    await _init();
    await _preferences!.setString(key, value);
  }

  Future<String> getString(String key) async {
    await _init();
    return _preferences!.getString(key) ?? '';
  }

  Future<void> removeString(String key) async {
    await _init();
    await _preferences!.remove(key);
  }

  Future<void> clear() async {
    await _init();
    await _preferences!.clear();
  }
}

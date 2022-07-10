import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
 

  static final DataStorage _instance = DataStorage._internal();

  factory DataStorage() {
    return _instance;
  }

  DataStorage._internal();

  SharedPreferences? _preferences;

  initSharePreferenceIfNeed() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  void saveString(String key, String value) async {
    await initSharePreferenceIfNeed();
    _preferences!.setString(key, value);
  }

  void saveInt(String key, int value) async {
    await initSharePreferenceIfNeed();
    _preferences!.setInt(key, value);
  }

  Future<String?> loadString(String key) async {
    await initSharePreferenceIfNeed();
    return _preferences!.getString(key);
  }

  Future<int?> loadInt(String key) async {
    await initSharePreferenceIfNeed();
    return _preferences!.getInt(key);
  }

  Future<void> deleteString(String key) async {
    await initSharePreferenceIfNeed();
    _preferences!.remove(key);
  }

  void clear(List<String> keys) {
    for (var key in keys) {
      deleteString(key);
    }
  }

  void saveBool(String key, bool value) async {
    await initSharePreferenceIfNeed();
    _preferences!.setBool(key, value);
  }

  Future<bool?> loadBool(String key) async {
    await initSharePreferenceIfNeed();
    return _preferences!.getBool(key);
  }
}

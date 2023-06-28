import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreference {

  static const _isKatyaKey = 'ISKATYA';

  Future<void> _savePreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> _getPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPreference = prefs.getString(key);
    if (savedPreference == null) {
      return "";
    }
    return savedPreference;
  }

  Future<void> _saveBool(String key, bool value) {
    return _savePreference(key, value.toString());
  }

  Future<bool?> _getBool(String key) async {
    switch (await _getPreference(
      key,
    )) {
      case "false":
        return false;
      case "true":
        return true;
    }
    return null;
  }

  void saveIsKatya(bool value) {
    _saveBool(_isKatyaKey, value);
  }

  Future<bool?> getIsKatya() async {
    return await _getBool(_isKatyaKey);
  }

  Future<String> getUserName() async { 
    final isKatya = await getIsKatya();
    if(isKatya == null) {
      return '';
    }
    return isKatya ? 'KASIA' : 'MAMA';
  }
}
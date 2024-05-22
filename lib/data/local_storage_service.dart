import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _isLoggedInKey = 'isLoggedIn';

  Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }
}

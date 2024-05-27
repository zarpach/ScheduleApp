import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String departmentIdKey = 'departmentId';
  static const String groupIdKey = 'groupId';
  static const String dayOfWeekKey = 'dayOfWeek';

  static Future<void> saveSlotParameters({
    required int departmentId,
    required int groupId,
    required int dayOfWeek,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(departmentIdKey, departmentId);
    await prefs.setInt(groupIdKey, groupId);
    await prefs.setInt(dayOfWeekKey, dayOfWeek);
  }

  static Future<Map<String, int>> loadSlotParameters() async {
    final prefs = await SharedPreferences.getInstance();
    final departmentId = prefs.getInt(departmentIdKey) ?? 14;
    final groupId = prefs.getInt(groupIdKey) ?? 0;
    final dayOfWeek = prefs.getInt(dayOfWeekKey) ?? 1;
    return {
      'departmentId': departmentId,
      'groupId': groupId,
      'dayOfWeek': dayOfWeek,
    };
  }

  Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }
}

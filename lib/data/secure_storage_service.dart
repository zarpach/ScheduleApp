import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> setIsLoggedIn(bool value) async {
    await _storage.write(key: 'isLoggedIn', value: value.toString());
  }

  Future<bool> getIsLoggedIn() async {
    String? value = await _storage.read(key: 'isLoggedIn');
    return value == 'true';
  }
}

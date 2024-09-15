import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  bool isLoggedIn = false;
  final tokenStorage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await tokenStorage.write(key: 'uid', value: token);
  }

  Future<String?> readToken() async {
    String? savedToken = await tokenStorage.read(key: 'uid');

    return savedToken;
  }

  Future<void> deletToken(String key) async {
    await tokenStorage.delete(key: key);
  }
}

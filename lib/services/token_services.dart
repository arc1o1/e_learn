// services/token_service.dart
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService {
  final GetStorage _storage = GetStorage();

  // save access token
  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write('accessToken', accessToken);
  }

  // read access token
  Future<String?> getAccessToken() async {
    return await _storage.read('accessToken') ?? '';
  }

  String? getAccessTokenSync() {
    return _storage.read('accessToken');
  }

  // delete the access token
  Future<void> deleteAccessToken() async {
    await _storage.remove('accessToken');
  }

  // check validity
  bool isAccessTokenValid() {
    final token = getAccessTokenSync();
    if (token == null || token.isEmpty) return false;
    return !JwtDecoder.isExpired(token);
  }

  // save refresh token
  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write('refreshToken', refreshToken);
  }

  // read refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read('refreshToken') ?? '';
  }

  String? getRefreshTokenSync() {
    return _storage.read('refreshToken');
  }

  // delete the refresh token
  Future<void> deleteRefreshToken() async {
    await _storage.remove('refreshToken');
  }

  // check validity
  bool isRefreshTokenValid() {
    final token = getRefreshTokenSync();
    if (token == null || token.isEmpty) return false;
    return !JwtDecoder.isExpired(token);
  }
}

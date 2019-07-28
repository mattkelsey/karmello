import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karmello/services/api.dart';

class TokenProvider {
  static final storage = new FlutterSecureStorage();

  static setTokenFromCode(String code) {
    ApiProvider.tokenPost(code).then((response) async {
      if (response.statusCode == 200) {
        String token = await response.stream.bytesToString();
        _storeToken(token);
      } else {
        print(response.statusCode);
        print(await response.stream.bytesToString());
        // TODO: Handle errors
      }
    });
  }

  static void _setRefreshedToken(String refreshToken) {
    ApiProvider.tokenPost(refreshToken, isRefresh: true).then((response) async {
      String tokenString = await response.stream.bytesToString();
      var newTokenObj = jsonDecode(tokenString);
      newTokenObj['refresh_token'] = refreshToken;
      _storeToken(jsonEncode(newTokenObj));
    });
  }

  static void _storeToken(String token) async {
    storage.write(key: 'token', value: token);
  }

  // TODO: Don't refresh token evertime.
  static Future<String> getToken() async {
    String oldToken = await storage.read(key: 'token');
    _setRefreshedToken(json.decode(oldToken)['refresh_token']);
    String newToken = await storage.read(key: 'token');
    return jsonDecode(newToken)['access_token'];
  }
}
import 'package:http/http.dart' as http;
import 'package:karmello/services/token.dart';

class ApiProvider {
  static final String redditBase = "https://oauth.reddit.com";
  static Future<http.Response> get(String subUrl) async {
    String token = await TokenProvider.getToken();
    final headers = {
      'User-Agent': 'android:com.moonbison.karmello:v0.0.0 (by /u/moonbison)', // TODO
      'Authorization': 'bearer ' + token,
    };
    return http.get(redditBase + subUrl, headers: headers,);
  }

  // TODO: Code is currently either the code or the refresh token. Yikes.
  static Future<http.StreamedResponse> tokenPost(String code, {bool isRefresh = false}) {
    var req = new http.MultipartRequest("POST", Uri.parse('https://www.reddit.com/api/v1/access_token'));
    req.fields['grant_type'] = isRefresh ? 'refresh_token' : 'authorization_code';
    req.fields[isRefresh ? 'refresh_token' : 'code'] = code;
    if (!isRefresh) req.fields['redirect_uri'] = 'https://moonbison.com/karmello/auth'; // TODO: Store somewhere globally
    req.headers['Authorization'] = 'Basic UUREakRKRjF5X21LeUE6';
    req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return req.send();
  }
  
  static Future<http.StreamedResponse> refreshPost(String code) {
    var req = new http.MultipartRequest("POST", Uri.parse('https://www.reddit.com/api/v1/access_token'));
    req.fields['grant_type'] = 'authorization_code';
    req.fields['code'] = code;
    req.fields['redirect_uri'] = 'https://moonbison.com/karmello/auth'; // TODO: Store somewhere globally
    req.headers['Authorization'] = 'Basic UUREakRKRjF5X21LeUE6';
    req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return req.send();
  }
}
import 'package:http/http.dart';
import 'package:karmello/services/api.dart';
import 'package:flutter_test/flutter_test.dart';
main() {
  final token = 'asd';
  test("get() method should get", () async {
    Response response = await ApiProvider.get("/api/v1/me");
    expect(response.statusCode, equals(200));
    expect(response.body, contains("name"));
  });

  test("get()ing a subreddit should return a Listing", () async {
    Response response = await ApiProvider.get("/r/grilledcheese");
    expect(response.statusCode, equals(200));
    print(response.body);
  });
}
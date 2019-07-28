import 'package:karmello/reddit/Listing.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_listing.dart';
main() {
  test("Creating a Listing object from JSON should create a valid Listing", () {
    Listing l = Listing.fromJson(ListingMock.mock);
    expect(l.children[0].subreddit, equals('grilledcheese'));
    print(l);
  });
}
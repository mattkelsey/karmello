import 'package:karmello/reddit/Post.dart';

class Listing { // TODO, should be generic
  String modhash;
  int dist;
  List<Post> children; // Should be list of posts once posts is defined;
  String after;
  String before;
  
  Listing.fromJson(Map<String, dynamic> json) {
    this.modhash = json['data']['modhash'];
    this.dist = json['data']['dist'];
    this.after = json['data']['after'];
    this.before = json['data']['before'];
    this.children = new List<Post>();
    for (Map<String, dynamic> postModel in json['data']['children']) {
      this.children.add(Post.fromJson(postModel));
    }
      // children = json['data']['children'].map((Map post) => Post.fromJson(post)).toList(),
  }
}
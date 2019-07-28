import 'package:karmello/reddit/Preview.dart';

class Post { 
  // Post information.
  final String subreddit;
  final String selftext;
  final String author;
  final String title;
  final bool quarantine;
  final String post_hint;
  final DateTime created;// use from epoch on incoming JSON
  final bool pinned;
  final bool over_18; // Sort of post type.
  final Uri url;
  final int num_comments;
  final String permalink;

  final Preview preview;
  final Uri thumbnail;

  // Score information.
  final int score;
  final int downs;
  final int ups;
  final int gilded;
  final bool hide_score;

  // By user information.
  final bool saved;
  final bool hidden;

  // ids
  final String id;
  final String author_fullname;
  final String name; // Same as id, but with type prepended.
  final String subreddit_id;

  // Misc
  final String subreddit_type;
  final int total_awards_received;
  final DateTime created_utc;
  final bool is_video;

  Post.fromJson(Map<String, dynamic> json)
  : subreddit = json['data']['subreddit'],
    selftext = json['data']['selftext'],
    author = json['data']['author'],
    title = json['data']['title'],
    quarantine = json['data']['quarantine'],
    post_hint = json['data']['post_hint'],
    created = DateTime.fromMillisecondsSinceEpoch((json['data']['created'] as double).round()),
    pinned = json['data']['pinned'],
    over_18  = json['data']['over_18'],
    url = Uri.parse(json['data']['url']),
    num_comments = json['data']['num_comments'],
    permalink = json['data']['permaline'],
    score = json['data']['score'],
    downs = json['data']['downs'],
    preview = (json['data']['preview'] == null) ? null : Preview.fromJson(json['data']['preview']),
    thumbnail = Uri.parse(json['data']['thumbnail']),
    ups = json['data']['ups'],
    gilded = json['data']['gilded'],
    hide_score = json['data']['hide_score'],
    saved = json['data']['saved'],
    hidden = json['data']['hidden'],
    id = json['data']['id'],
    author_fullname = json['data']['author_fullname'],
    name = json['data']['name'],
    subreddit_id = json['data']['subreddit_id'],
    subreddit_type = json['data']['subreddit_type'],
    total_awards_received = json['data']['total_awards_received'],
    created_utc = DateTime.fromMillisecondsSinceEpoch((json['data']['created_utc'] as double).round()),
    is_video = json['data']['is_video'];
}
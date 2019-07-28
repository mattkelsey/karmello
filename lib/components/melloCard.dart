import 'package:flutter/material.dart';
import 'package:karmello/reddit/Post.dart';

class melloCard extends StatelessWidget {
  final Post post;
  melloCard({ @required this.post });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(
                fontSize: 18
              )
            ),
            Divider(),
            (this.post.preview != null) ? FadeInImage(
              // height: 200,
              // width: 200,
              placeholder: NetworkImage(this.post.url.toString()),
              image: NetworkImage(this.post.url.toString()),
            ) : Text('')
          ],
        )
      )
    );
  }
}
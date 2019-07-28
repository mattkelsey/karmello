import 'package:flutter/material.dart';
import 'package:karmello/components/melloCard.dart';
import 'package:karmello/reddit/Listing.dart';
import 'package:karmello/reddit/Post.dart';
import 'package:karmello/services/api.dart';
import 'dart:convert';


class CardContainer extends StatelessWidget {
  Widget _buildCardSlice(BuildContext context, int index, List<Post> postSlice) {
    return melloCard(post: postSlice[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: FutureBuilder(
          future: ApiProvider.get('/r/grilledcheese'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Listing listing = Listing.fromJson(json.decode(snapshot.data.body));
              return ListView.builder(
                itemCount: listing.dist,
                padding: EdgeInsets.all(10.0),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildCardSlice(context, index, listing.children);
                }
              );
            } else {
              return Text('Yeeting you some data...');
            }
          }
        )
      )
    );
  }
}
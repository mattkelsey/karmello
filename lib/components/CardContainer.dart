import 'package:flutter/material.dart';
import 'package:karmello/components/melloCard.dart';


class CardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              melloCard(),
              melloCard(),
              melloCard(),
              melloCard()
            ],
          )
        )
      )
    );
  }
}
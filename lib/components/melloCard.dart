import 'package:flutter/material.dart';

class melloCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Card(
        elevation: 5.0,
        child: Container(
          width: 1000,
          height: 100
        )
      )
    );
  }
}
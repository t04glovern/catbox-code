import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';

class DetailsShowcase extends StatelessWidget {
  final Cat cat;

  DetailsShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        "Details",
        textAlign: TextAlign.center,
      ),
    );
  }
}

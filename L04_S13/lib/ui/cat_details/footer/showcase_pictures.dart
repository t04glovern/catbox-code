import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';

class PicturesShowcase extends StatelessWidget {
  final Cat cat;

  PicturesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        "Pictures",
        textAlign: TextAlign.center,
      ),
    );
  }
}

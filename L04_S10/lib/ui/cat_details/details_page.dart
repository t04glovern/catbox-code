import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsPage(
    this.cat, {
    @required this.avatarTag,
  });

  @override
  _CatDetailsPageState createState() => new _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          //TODO Decoration
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO Page Children
            ],
          ),
        ),
      ),
    );
  }
}

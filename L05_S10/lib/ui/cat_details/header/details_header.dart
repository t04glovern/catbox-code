import 'package:catbox/models/cat.dart';
import 'package:catbox/ui/cat_details/header/cut_colored_image.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailHeader(
    this.cat, {
    @required this.avatarTag,
  });

  @override
  _CatDetailHeaderState createState() => new _CatDetailHeaderState();
}

class _CatDetailHeaderState extends State<CatDetailHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;

    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB42A5F5),
    );

    var avatar = new Hero(
      tag: widget.avatarTag,
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.cat.avatarUrl),
        radius: 75.0,
      ),
    );

    var likeInfo = new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 16.0,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              widget.cat.likeCounter.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            )
          )
        ],
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {
                //TODO Handle Adopt
              },
              child: new Text('ADOPT ME'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.grey,
              textColor: Colors.white,
              onPressed: () async {
                //TODO Handle Like
              },
              child: new Text('LIKE'),
            ),
          ),
        ],
      ),
    );

    return new Stack(
      children: [
        diagonalBackground,
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: [
              avatar,
              likeInfo,
              actionButtons,
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.white),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter is Cool!'),
          leading: new Icon(
            Icons.cake
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.sd_card),
              tooltip: 'Hi!',
              onPressed: () => {},
            ),
            new IconButton(
              icon: new Icon(Icons.pie_chart),
              tooltip: 'Wow!',
              onPressed: () => {},
            ),
            new IconButton(
              icon: new Icon(Icons.photo_album),
              tooltip: 'Snap!',
              onPressed: () => {},
            ),
          ],
        ),
        body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              new Text("Hello World"),
              new TextField(
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter text!'
                ),
              ),
              new Checkbox(
                value: true,
                onChanged: (bool value) {

                },
              ),
              new Radio<int>(
                value: 0,
                groupValue: 0,
                onChanged: (_){},
              ),
              new Switch(
                value: false,
                onChanged: (bool value) {

                }
              ),
              new ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: const Text('Raised'),
                    onPressed: () {
                      // Perform some action
                    },
                  ),
                  const RaisedButton(
                    child: const Text('Disabled'),
                    onPressed: null,
                  ),
                ],
              ),
              new ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new FlatButton(
                    child: const Text('Flat'),
                    onPressed: () {
                      // Perform some action
                    },
                  ),
                  const FlatButton(
                    child: const Text('Disabled'),
                    onPressed: null,
                  ),
                ],
              ),
              new ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new OutlineButton(
                    child: const Text('Outline'),
                    onPressed: () {
                      // Perform some action
                    },
                  ),
                  const RaisedButton(
                    child: const Text('Disabled'),
                    onPressed: null,
                  ),
                ],
              ),
            ]
          )
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance),
              title: new Text("Bank")
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.apps),
              title: new Text("Apps")
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_basket),
              title: new Text("Shop")
            ),
          ],
        ),
      ),
    );
  }
}

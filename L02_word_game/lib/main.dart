import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Word Game',
      home: new RandomSentences(),
    );
  }
}

class RandomSentences extends StatefulWidget {
  @override
  createState() => new _RandomSentencesState();
}

class _RandomSentencesState extends State<RandomSentences> {

  final _sentences = <String>[];
  final _funnies = new Set<String>();
  final _biggerFont = const TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Game'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
              onPressed: _pushFunnies,
            )
        ],
      ),
      body: _buildSentences(),
    );
  }

  void _pushFunnies() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _funnies.map(
            (sentence) {
              return new ListTile(
                title: new Text(
                  sentence,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Funny Sentences'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  String _getSentence() {
    final noun = new WordNoun.random();
    final adjective = new WordAdjective.random();
    return "The programmer wrote a ${adjective.asCapitalized}"
        " app in Flutter and showed it "
        "off to his ${noun.asCapitalized}";
  }

  Widget _buildRow(String sentence) {
    final alreadyFoundFunny = _funnies.contains(sentence);
    return new ListTile(
      title: new Text(
        sentence,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadyFoundFunny ? Icons.thumb_up : Icons.thumb_down,
        color: alreadyFoundFunny ? Colors.green : null,
      ),
      onTap: () {
        setState(() {
          if (alreadyFoundFunny) {
            _funnies.remove(sentence);
          } else {
            _funnies.add(sentence);
          }
        });
      },
    );
  }

  Widget _buildSentences() {
  return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // An ItemBuilder callback is used to add sentences and dividers
      // based on when the user scrolls down the view.
      itemBuilder: (context, i) {
        // Adds a pixel divider before each row
        if (i.isOdd) return new Divider();
        // Divides i by 2 then returns the value into index
        // This counts how many sentences are in the ListView
        final index = i ~/ 2;
        // Checks to see if we've hit the end of the sentence list
        if (index >= _sentences.length) {
          // If we have then we generate another 10
          for (int x = 0; x < 10; x++) {
            _sentences.add(_getSentence());
          }
        }
        return _buildRow(_sentences[index]);
      },
    );
  }

}

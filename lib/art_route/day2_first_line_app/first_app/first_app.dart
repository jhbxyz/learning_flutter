import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RandomWordsApp());
}

class RandomWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWordsPage(),
    );
  }
}

class RandomWordsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomWordsPageState();
  }
}

class _RandomWordsPageState extends State<RandomWordsPage> {
  final _suggestions = <WordPair>[];
  final _save = Set<WordPair>();
  var _biggerFont = TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal);

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) {
          //如果是奇数
          return Divider(
            height: 1.0,
          );
        }
        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          //如果达到了单词的最未位处
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions());
  }

  Widget _buildRow(WordPair wordPair) {
    var isSaved = _save.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _save.remove(wordPair);
          } else {
            _save.add(wordPair);
          }
        });
      },
    );
  }
}

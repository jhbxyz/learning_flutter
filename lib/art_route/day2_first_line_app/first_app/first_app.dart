import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RandomWordsApp());
}

class RandomWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
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
  var randomWord = WordPair.random();
  var wordList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('haha'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(wordList[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.0,
            );
          },
          itemCount: wordList.length),
    );
  }
}

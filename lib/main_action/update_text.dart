import 'package:flutter/material.dart';

void main() => runApp(MyTextHome());

class MyTextHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextChangeView(
        title: '文字改变',
      ),
    );
  }
}

class TextChangeView extends StatefulWidget {
  TextChangeView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _TextChangeState();
  }
}

class _TextChangeState extends State<TextChangeView> {
  String _textShow = 'origin  text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(_textShow),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.update),
          tooltip: 'update',
          onPressed: _onChangeText),
    );
  }

  void _onChangeText() {
    setState(() {
      _textShow = 'update text';
    });
  }
}

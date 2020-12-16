import 'package:flutter/material.dart';

void main() => runApp(ListViewApp());

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData.light(),
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.amber[500],
            child: Center(
              child: Text('Entry A'),
            ),
          ),
          Container(
            height: 50.0,
            color: Colors.amber[300],
            child: Center(
              child: Text('Entry B'),
            ),
          ),
          Container(
            height: 50.0,
            color: Colors.amber[100],
            child: Center(
              child: Text('Entry C'),
            ),
          ),
        ],
      ),
    );
  }
}

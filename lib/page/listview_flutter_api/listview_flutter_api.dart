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
  var entries = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Entry ${entries[index]}'),
          );
        },
        //分割线样式
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}

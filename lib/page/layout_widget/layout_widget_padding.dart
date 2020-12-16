import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Widget'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Container',
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

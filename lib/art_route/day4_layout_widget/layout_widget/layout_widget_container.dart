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
        body: Container(
          //居中显示
          alignment: AlignmentDirectional.center,
          //padding
          padding: EdgeInsets.all(10.0),
          //背景
//          color: Colors.orange,
          child: Text(
            'Container',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

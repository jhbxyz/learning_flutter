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
          margin: EdgeInsets.all(20),
          width: 500,
          height: 300,
          color: Colors.amber,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 100,
                left: 200,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  color: Colors.redAccent,
                  child: Text('Positioned'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 30,
                color: Colors.lightBlue,
                child: Text('Non Positioned'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

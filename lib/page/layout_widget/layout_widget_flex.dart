import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flex'),
        ),
        body: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.blue,
                height: 60.0,
                alignment: Alignment.center,
                child: Text(
                  'left',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new Container(
                color: Colors.green,
                height: 60,
                alignment: Alignment.center,
                child: const Text(
                  'right',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

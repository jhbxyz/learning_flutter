import 'package:flutter/material.dart';

void main() {
  //入口函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(
        title: '这是标题',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeState createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHomePage> {
  int _counter = 0;

  void _onPressedBtn() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击吗?小老弟',
            ),
            Text(
              '点击了 $_counter次',
              style:Theme.of(context).textTheme.display1,

            ),
            FloatingActionButton(
              child: Text('点击'),
              onPressed: _onPressedBtn,
            )
          ],
        ),
      ),
    );
  }
}

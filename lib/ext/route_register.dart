import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Demo',
//      initialRoute: '/First',
      routes: {
        //注册路由
        '/First': (context) => FirstPage(),
        '/Second': (context) => SecondPage(),
      },
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.redAccent[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '当前页面 FirstPage',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                '去下一个页面',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //注册路由跳转页面 注意名字不要写错
                Navigator.pushNamed(context, '/Second');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.greenAccent[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '当前页面是 SecondPage',
              textDirection: TextDirection.ltr,
            ),
            RaisedButton(
              child: Text('返回前一个页面'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

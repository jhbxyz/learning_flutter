# Route 路由以及页面间传值

* 一种页面跳转机制
* 路由 Route 对应到 Android 就是 Intent 
* Flutter 路由分两种：新建路由、注册路由
* 需要Route表示 Navigator进行管理
* 跳转页面 Navigator.push()
* 返回页面 Navigator.pop()
* 传值

### 1.新建路由

```java
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Route Demo'),
        ),
        body: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              //新建路由跳转页面
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            },
          ),
        ],
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
                //返回上一个页面
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```





### 2.注册路由

```java
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
```



### 3.传值










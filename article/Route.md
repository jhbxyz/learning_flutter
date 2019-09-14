# Route 路由以及页面间传值

* 一种页面跳转机制
* 路由 Route 对应到 Android 就是 Intent 
* Flutter 路由分两种：新建路由、注册路由
* 需要Route表示 Navigator进行管理
* 跳转页面 Navigator.push()
* 返回页面 Navigator.pop()
* 传值

[https://github.com/jhbxyz/flutter_learn_art/blob/master/images/route_jump_gif.gif](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/route_jump_gif.gif)

### 1.新建路由

```dart
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

```dart
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



### 3.传值(两种方式) 返回值

`效果`

[https://github.com/jhbxyz/flutter_learn_art/blob/master/images/remote_pass_value_gif.gif](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/remote_pass_value_gif.gif)

##### 3.1.新建路由传值

* 通过 MaterialPageRoute  settings 参数包装要传递的值

* RouteSettings 对象的 copyWith() 方法的arguments参数传值

* 具体请看详细代码或者**源码**

* ```java
  var routeSettings = RouteSettings();
  //携带第一个页面的参数
  var copyWithSettings = routeSettings.copyWith(arguments: _editController.text);
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SecondPage();
        },
        settings: copyWithSettings,
      ));
  ```

##### 3.2.注册路由传值

* 比新建路由传值简单，arguments参数中传值

```java
// 注册路由传值
void goNextPage2(BuildContext context) {
  Navigator.pushNamed(context, '/Second', arguments: '传递的值');
}
```



`示例代码`

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

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var _editController = TextEditingController();
    return Container(
      width: double.infinity,
      color: Colors.redAccent[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '第一个页面(FirstPage)',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                labelText: '请输入传递的值',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: _editController,
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              '去第二个页面',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // 去第二个页面
              goNextPage(_editController, context);
            },
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(secondValue,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }

  var secondValue = '第二个页面传递的值是: ';

  // 新建路由传值
  void goNextPage(
      TextEditingController _editController, BuildContext context) async {
    var routeSettings = RouteSettings();
    //携带第一个页面的参数
    var copyWithSettings =
        routeSettings.copyWith(arguments: _editController.text);
    //返回第二个页面的参数
    var valueFromSecondPage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SecondPage();
          },
          settings: copyWithSettings,
        ));

    debugPrint('valueFromSecondPage = $valueFromSecondPage');

    setState(() {
      secondValue = secondValue + "$valueFromSecondPage";
    });
  }
}

// 注册路由传值
void goNextPage2(BuildContext context) {
  Navigator.pushNamed(context, '/Second', arguments: '传递的值');
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var passValue = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.orange[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '第二个页面(SecondPage)',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
              textDirection: TextDirection.ltr,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                '上一个页面传递的值是: $passValue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
                textDirection: TextDirection.ltr,
              ),
            ),
            RaisedButton(
              child: Text('返回前一个页面'),
              onPressed: () {
                //第二个参数是返回值 这个值是 Object 对象的类型
                Navigator.pop(context, "第一个页面你好!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
```



# 4.源码地址

[https://github.com/jhbxyz/flutter_learn_art/tree/master/lib/ext/day1_route](https://github.com/jhbxyz/flutter_learn_art/tree/master/lib/ext/day1_route)

# 5.文章

[https://github.com/jhbxyz/flutter_learn_art/blob/master/article/Route.md](https://github.com/jhbxyz/flutter_learn_art/blob/master/article/Route.md)


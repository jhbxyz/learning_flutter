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

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widget',
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppPageState();
  }
}

//图片路径
final imageUrl =
    'https://images.unsplash.com/photo-1568114813528-471a736a8fd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';

class _MyAppPageState extends State<MyAppPage> {
  var _editController = TextEditingController();

  //构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Widget'),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                '我是文本 Text',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    fontSize: 18.0),
              ),
              Row(
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              TextField(
                controller: _editController,
                //自动弹起软键盘
                autofocus: true,
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text('我是 FlatButton'),
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('我是 RaisedButton'),
                    color: Colors.cyanAccent,
                    elevation: 10,
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
                elevation: 10,
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.green,
                onPressed: () {
                  debugPrint('onPressed');
                },
              )
            ],
          )),
    );
  }

  //create之后被insert到渲染树时调用的，只会调用一次
  @override
  void initState() {
    super.initState();
    _editController.addListener(() {});
  }

  //state依赖的对象发生变化时调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //Widget状态改变时候调用，可能会调用多次
  @override
  void didUpdateWidget(MyAppPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //当移除渲染树的时调用
  @override
  void deactivate() {
    super.deactivate();
  }

  //Widget即将销毁时调用
  @override
  void dispose() {
    super.dispose();
    _editController.dispose();
  }
}

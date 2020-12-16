import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Widget'),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 3, // 占3/5
                      child: TextField(
                        controller: _controller,
                      )),
                  Expanded(
                    flex: 2, // 占 2/5
                    child: FlatButton(
                        onPressed: () {
                          //点击的时候清空输入框
                          _controller.text = '';
                        },
                        color: Colors.redAccent,
                        child: Text('清空')),
                  )
                ],
              ),

              //点击确定按钮的时候把用户输入的文字用弹窗展示出来
              // **注意** StatelessWidget 只能用于显示信息，不能有其他动作
              //所以要把 RaisedButton 包装一下
              //通过构造把值传过去
              MyRaisedButton(_controller.text),
            ],
          )),
    );
  }
}

class MyRaisedButton extends StatefulWidget {
  MyRaisedButton(this.content, {Key key}) : super(key: key);
  final String content;

  @override
  State<StatefulWidget> createState() {
    return _MyRaisedButtonState();
  }
}

class _MyRaisedButtonState extends State<MyRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.orange,
      onPressed: () {
        //调用setState方法重绘 Widget 走 build() 方法
        setState(() {
          _showDialog(context);
        });
      },
      child: Text('确定'),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text(
              widget.content,
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            actions: <Widget>[],
          );
        });
  }
}

# Flutter 布局

* Container ：设置Widget的背景、尺寸、定位、margin等（ Android 的 ViewGrope）可以看成是 Padding、Center 的封装。
* Padding：加 padding
* Center：让 child 居中
* Expand ：撑开 Flex 子 Widget（Row、Column）空间的布局
* Row：在水平方向上布置子窗口Widget列表（Android 水平方向的线性布局）。
* Column：在垂直方向上布置子窗口Widge列表（Android 垂直方向的线性布局）。

* Stack
* 

### 1.Container

`效果`



`示例`

```java
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
          //padding
          padding: EdgeInsets.all(10.0),
          //背景
//          color: Colors.orange,
          child: Text('Container'),
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
```



### 2.Padding  这是个 Widget

* 就是为了增加 padding

`示例`

```java
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
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Container',
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
```

### 3.Center 

* 就是让Widget 居中显示
* Container Widget 的 alignment: AlignmentDirectional.center,参数也可以达到这个效果

`效果`



`示例`

```java
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
//          alignment: AlignmentDirectional.center,
          //padding
          padding: EdgeInsets.all(10.0),
          //居中显示
          child: Center(
            child: Text(
              'Container',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
```

### 4.Row & Column

* **看上一篇文章代码**
*  相当于Android LinearLayout 的 Horizontal 和 Vertical 的属性 挨个排列
* 详情看：**5.Expand**

### 5.Expand

* Expand 的使用
* RaisedButton 的封装
* StatefulWidget 和 StatelessWidget区别的理解（看注释）
* StatefulWidget 生命周期的理解
* setState() 方法的使用
* Dialog 的使用

`效果`



`示例`

```java
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
        _showDialog(context);
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
```




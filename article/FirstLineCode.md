# 一文学习 Flutter 基础组件

* 详细内容都在注释上
* 一切皆 Widget
* StatelessWidget  StateFulWidget 的区分
* 一些基础组件的使用



`一个基础学习内容`

```Dart
import 'package:flutter/material.dart';

//程序的入口函数和 Java 类似
void main() {
//  启动哪个 widget
  runApp(MyApp());
}

//Flutter 中一切都是 Widget 包括边距 手势 动画 路由 等等 一切皆 Widget
//StatelessWidget(无状态)  StateFulWidget (有状态 需要配合 State 使用 有生命周期)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp Material design 风格的 App
    return MaterialApp(
      title: 'My First Line',
      // Scaffold 一个 App 骨架
      home: Scaffold(
        // title 相当于 Android Toolbar
        appBar: AppBar(
          title: Text('My First Line'),
        ),
        body: Center(
          // RaisedButton 一个凸起的 button 还有 FlatButton FloatingActionButton 相当于 Android 中的 FAB
//          child: RaisedButton(
//              child: Text('click me'),
//              onPressed: () {
//                debugPrint('点击了按钮');
//                _showDialog(context);
//              }),
          child: MyRaisedButton(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('FAB'),
          tooltip: "长按提示语",
          onPressed: null, //点击回调
        ),
      ),
    );
  }
}

// 以_下划线开头表示私有方法
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text('确定要好好学习 Flutter 吗?'),
      );
    },
    barrierDismissible: false,
  );
}

//自定义 RaisedButton  是因为 之前是无状态的 StatelessWidget 不能弹出对话框
class MyRaisedButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyRaisedButtonState();
  }
}

class MyRaisedButtonState extends State<MyRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('click me'),
        onPressed: () {
          debugPrint('点击了按钮');
          _showDialog(context);
        });
  }
}
```

`效果`

![](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/listview_3.jpg)
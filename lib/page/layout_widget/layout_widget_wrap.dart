import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap Layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wrap Layout'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            //主轴方向
            direction: Axis.horizontal,
            //主轴方向的距离
            spacing: 8,
            //交叉轴方向的间距 当前是水平 他的交叉轴就是垂直
            runSpacing: 3,

            children: <Widget>[
              // 碎片
              Chip(
                  backgroundColor: Colors.cyanAccent,
                  avatar: CircleAvatar(
                    child: Text('5'),
                  ),
                  label: Text("蛮子")),
              Chip(backgroundColor: Colors.red, label: Text("瞎子")),
              Chip(
                  backgroundColor: Colors.lightGreenAccent,
                  label: Text("纳什男爵")),
              Chip(backgroundColor: Colors.cyanAccent, label: Text("影流")),
              Chip(backgroundColor: Colors.amber, label: Text("娃娃鱼")),
              Chip(backgroundColor: Colors.yellowAccent, label: Text("疾风剑豪")),
              Chip(backgroundColor: Colors.redAccent, label: Text("刀锋之影")),
              Chip(backgroundColor: Colors.amber[900], label: Text("盖伦")),
              Chip(backgroundColor: Colors.green, label: Text("小学生之手")),
            ],
          ),
        ),
      ),
    );
  }
}

# Flutter ListView 的四种构建方式
### 1.Default constructor 默认构造形式
* 你可以构建一个个具体的子 View 

`默认构造`

```Dart
class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.amber[500],
            child: Center(
              child: Text('Entry A'),
            ),
          ),
          Container(
            height: 50.0,
            color: Colors.amber[300],
            child: Center(
              child: Text('Entry B'),
            ),
          ),
          Container(
            height: 50.0,
            color: Colors.amber[100],
            child: Center(
              child: Text('Entry C'),
            ),
          ),
        ],
      ),
    );
  }
}
```

`效果`

![https://github.com/jhbxyz/flutter_learn_art/blob/master/images/livstview_1.jpg](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/livstview_1.jpg)

### 2.ListView.builder 形式

- 你可以利用数组构建一组子 View 用于大量或无限的数据

`ListView.builder`

```Dart
class ListViewPageState extends State<ListViewPage> {
  var entries = ['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Entry ${entries[index]}'),
            );
          }),
    );
  }
}
```

### 3.ListView.separated 形式

- separatorBuilder 参数可以增加分割线样式

`ListView.separated`

```Dart
class ListViewPageState extends State<ListViewPage> {
  var entries = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Entry ${entries[index]}'),
          );
        },
        //分割线样式
        separatorBuilder: (context, indext) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
```

`效果`

![](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/livstview_2.jpg)

### 4.ListView.custom 形式

* 提供了自定义子Widget的能力



### 5.完整代码
`完整代码`

```Dart
import 'package:flutter/material.dart';

void main() => runApp(ListViewApp());

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData.light(),
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  var entries = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Entry ${entries[index]}'),
          );
        },
        //分割线样式
        separatorBuilder: (context, indext) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
```



 
# Flutter 基础 widget

主要下面基本 widget 常用到的

* StatelessWidget 和 StatefulWidget 的区别

* 文本 Text 相当于 Android 的 TextView

* 图片 Image 相当于 Android 的 ImageView

  图片的来源可以是网络、文件、资源和内存

  * Image.asset(name);
  * Image.file(file);
  * Image.memory(bytes);
  * Image.network(src);

* 输入框  TextField  相当于 Android 的 EditView

* 按钮 相当于 Android 的 Button

  * FlatButton 
  * RaisedButton
  * IconButton
  * FloatActionButton

### 1.StatelessWidget 和 StatefulWidget 的区别

Widget immutable(不可变的)

* StatelessWidget 是不可变的 不能有动作（用户交互）
* StatefulWidget 可变的 通过改变状态使得 UI 发生变化，它可以包含用户交互，因为widget都是 immutable 因此需要配合State来保存状态
* State拥有自己的声明周期

##### 1.1StatelessWidget

`示例`

```java
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
```

##### 1.2.StatefulWidget

`示例`

```java
class MyAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppPageState();
  }
}

class _MyAppPageState extends State<MyAppPage>{
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
```

##### 1.3 State 的生命周期

`示例`

```java
class _MyAppPageState extends State<MyAppPage> {
  
  //create之后被insert到渲染树时调用的，只会调用一次
  @override
  void initState() {
    super.initState();
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

  //构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return null;
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
  }
}
```

### 2.文本 Text 

`示例`

```java
class _MyAppPageState extends State<MyAppPage> {
  //构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Widget'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            '我是文本 Text',
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.red, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
```

### 3.图片 Image

图片的来源可以是网络、文件、资源和内存

- Image.asset(name);
- Image.file(file);
- Image.memory(bytes);
- Image.network(src);

**fit 参数** 子类 BoxFit

[BoxFit 身上有几个常量](https://api.flutter.dev/flutter/painting/BoxFit-class.html)

**contain**
全图显示，保持原比例。

![contain](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_contain.png)

**cover** （相当于 Android 的 centerCrop）
全图充满，可能拉伸也可能被裁剪

![cover](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_cover.png)

**fill**
全图显示，通过拉伸来充满目标框

![fill](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_fill.png)

**fitHeight**
图片高度充满目标框，可能拉伸也可能被裁剪	

![fitHeight](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_fitHeight.png)

**fitWidth**
图片宽度充满目标框，可能拉伸也可能被裁剪

![](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_fitWidth.png)

**none**
保持图片的原始大小，剪裁掉位于目标框外的图片部分

![none](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_none.png)

**scaleDown**
与contain缩小图像的方式相同，只不过会在必要时缩小以确保图片完全在目标框内，如果不缩小等同于none。

![scaleDown](https://github.com/jhbxyz/flutter_learn_art/blob/master/images/box_fit_scaleDown.png)

`示例`

```java
//图片路径
final imageUrl = 'https://images.unsplash.com/';
class _MyAppPageState extends State<MyAppPage> {
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
                    //图片路径
                    imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
```



### 4.输入框  TextField 

**完整代码请看下面代码链接**

`示例`

```java
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
              TextField(
                controller: _editController,
                //自动弹起软键盘
                autofocus: true,
              ),
            ],
          )),
    );
  }

  //create之后被insert到渲染树时调用的，只会调用一次
  @override
  void initState() {
    super.initState();
    _editController.addListener((){


    });
  }

  //Widget即将销毁时调用
  @override
  void dispose() {
    super.dispose();
    _editController.dispose();
  }
}
```



### 5.按钮

* onPressed 方法是事件的回调

`示例`

```java
class _MyAppPageState extends State<MyAppPage> {

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
            ],
          )),
    );
  }

}
```



# 参考资料

常用组件都在这里啦！按字母排序

[https://flutter.dev/docs/reference/widgets](https://flutter.dev/docs/reference/widgets)
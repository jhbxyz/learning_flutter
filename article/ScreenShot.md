# Flutter 某一个页面禁止用户截屏

### 1.背景

Flutter 项目中有一个需求，其中一个页面是不让截屏，因为是 Flutter 写的，所有肯定要和 Native 交互，这里主要用到了和原生通信以及一点 Android 禁止截屏的基础知识。

### 2.关键知识点

* Flutter 与原生通信这里用到了 **BasicMessageChannel**
* Android 知识点，在 Activity onCreate()中添加 getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE); 禁止截屏
*  getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE); 清楚标志位，允许截屏

### 3.Dart 

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CanScreenShotPage());

class CanScreenShotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "NoScreenShot", home: MyScaffold());
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CanScreenShotPage(可以截屏)'),
        centerTitle: true,
      ),
      body: Center(
        child: RawMaterialButton(
          highlightColor: Colors.redAccent,
          child: Text("跳转NoScreenShotPage页面(不可截屏)"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (b) {
              return NoScreenShotPage();
            }));
          },
        ),
      ),
    );
  }
}

class NoScreenShotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoScreenShotPageState();
  }
}

class _NoScreenShotPageState extends State<NoScreenShotPage> {
  var channel = BasicMessageChannel("截屏的标志", StandardMessageCodec());

  /**
   * 是否可以截屏
   */
  void _canScreenShot(bool can) {
    // 发送消息到 Native 是否可以截屏
    channel.send(can);
  }

  @override
  void initState() {
    super.initState();
    //页面初始化的时候可以截屏
    _canScreenShot(true);
  }

  @override
  void dispose() {
    super.dispose();
    //页面pop时候可以不可以截屏
    _canScreenShot(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoScreenShotPage(不可截屏)'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.orange,
          child: Text(
            "不能截屏",
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
        ),
      ),
    );
  }
}
```

4.Android

* 这个包下 package com.jhb.flutterlearnart.flutter_learn_art;

* ```java
  public class MainActivity extends FlutterActivity {
  
      @Override
      protected void onCreate(Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
          GeneratedPluginRegistrant.registerWith(this);
  
  
          BasicMessageChannel channel = new BasicMessageChannel<Object>(getFlutterView(), "截屏的标志", StandardMessageCodec.INSTANCE);
          channel.setMessageHandler(new BasicMessageChannel.MessageHandler() {
              @Override
              public void onMessage(Object o, BasicMessageChannel.Reply reply) {
  
                  if (o instanceof Boolean && (Boolean) o) {
  
                      getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
                  } else {
                      getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
                  }
              }
          });
      }
  }
  ```

  


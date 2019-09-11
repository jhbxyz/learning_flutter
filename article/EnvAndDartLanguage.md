# Flutter环境安装 Dart基础语法

## 1.Flutter 环境

* flutter doctor 用起来

* Flutter中文版 [https://flutterchina.club/get-started/install/](https://flutterchina.club/get-started/install/)
* 有能力的英语好的**官方文档** [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)



## 2.Dart 语法

熟悉 Java 和 Kotlin 等语言的上手 Dart 应该很快，了解一下语法特性即可！

主要一些特有特点，更详细的内容请看末尾的官方文档

* Dart 一切皆对象包括 int double 函数
* Dart 有类型推断功能
* Object 和 dynamic
* 可选参数
* Future
* 多继承



### 1.基本类型

`示例`

```java
void main(){

  bool isShow = false;
  int  count = 1;
  double height = 1.82;

  //类型推断
  var show = true;
  var counts = 10;
  var heights = 1.83;

  //跟 Java 中的final一样 在程序运行的时候赋值，赋值后值不再改变
  final money = 100000.01;

  //一个编译时常量，在程序编译的时候它的值就确定了
  const money2= 200000.01;

}
```



### 2.Object 和 dynamic

使用 Object 时，我们只是在说接受任意类型，我们需要的是一个 Object。类型系统会保证其类型安全。

使用 dynamic 则是告诉编译器，我们知道自己在做什么，**不用做类型检测**。当我们调用一个不存在的方法时，会执行 noSuchMethod() 方法，默认情况下（在 Object 里实现）它会抛出 NoSuchMethodError



### 3.可选参数

* 可选命名参数
* 可选位置参数
* 可以提供默认值(默认参数) 类似于 Kotlin

`示例`

```java

void main() {

  //可选命名参数
  choiceNameParams(param1: true, param2: '第二个参数');
  choiceNameParams(param1: false);
  choiceNameParams(param2: '第二个参数');

  //可选位置参数
  choicePositionParams('第一个参数', false, 10.0);
}

//可选命名参数
void choiceNameParams({bool param1=false, String param2 = '默认参数'}) {}

//可选位置参数
void choicePositionParams(String param1, [bool param2 = true, double param3 = 0.0]) {}

```



### 4.Future

Dart 是**单线程**的，主线程由一个事件循环来执行（类似 Android 的主线程）。对于异步代码，我们通过 Future 来获取结果

* async  await 关键字
* 注意 有无**await** 会影响代码的执行顺序

`示例`

```java
import 'package:flutter/material.dart';

void main() async{
 await getJoke().then((value) {
    debugPrint("value = $value");
  }).catchError((error) {
    debugPrint('error = $error');
  });
  debugPrint('end.....');
}

Future<String> getJoke() {
  return Future.delayed(Duration(seconds: 2),(){
    return 'this is a joke ';
  });
}

//Future<String> getJoke() {
//  return Future<String>(() {
//    throw new Exception('No joke for you');
//    return 'this is a joke ';
//  });
//}

//Future<String> getJoke() {
//  return Future<String>(() {
//    return 'this is a joke ';
//  });
//}
```

### 5.多继承

Dart是一个面向对象编程语言，支持基于Mixin的继承机制。Mixin可以理解为多继承，在with关键字的后面为一个或者多个类。

`示例`

```java
//人
class Person {
  void run() {}
}
//中国人
class Chinese {
  void say() {}
}
//学习
class Learn {
  void learnMusic() {}
  void learnEnglish() {}
}
//胡歌
class Huge extends Chinese with Person ,Learn{
  @override
  say() {
    print('说汉语');
  }
}

void main() {
  var huge = Huge();
  huge.run();
  huge.say();
  huge.learnEnglish();
  huge.learnMusic();
}
```

## 参考资料

[https://dart.dev/guides/language/language-tour#maps](https://dart.dev/guides/language/language-tour#maps)

## 源码地址

[https://github.com/jhbxyz/flutter_learn_art/blob/master/lib/art_route/day3_dart_language/dart_language.dart](https://github.com/jhbxyz/flutter_learn_art/blob/master/lib/art_route/day3_dart_language/dart_language.dart)

## 文章地址

[https://github.com/jhbxyz/flutter_learn_art/blob/master/article/EnvAndDartLanguage.md](https://github.com/jhbxyz/flutter_learn_art/blob/master/article/EnvAndDartLanguage.md)
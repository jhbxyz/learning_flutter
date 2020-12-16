void main3() {
  bool isShow = false;
  int count = 1;
  double height = 1.82;

  //类型推断
  var show = true;
  var counts = 10;
  var heights = 1.83;

  //跟 Java 中的final一样 在程序运行的时候赋值，赋值后值不再改变
  final money = 100000.01;

  //一个编译时常量，在程序编译的时候它的值就确定了
  const money2 = 200000.01;
}

void main2() {
  //可选命名参数
  choiceNameParams(param1: true, param2: '第二个参数');
  choiceNameParams(param1: false);
  choiceNameParams(param2: '第二个参数');

  //可选位置参数
  choicePositionParams('第一个参数', false, 10.0);
}

//可选命名参数
void choiceNameParams({bool param1 = false, String param2 = '默认参数'}) {}

//可选位置参数
void choicePositionParams(String param1,
    [bool param2 = true, double param3 = 0.0]) {}






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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo 1',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Demo 1'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'assets/images/image_car.jpeg',
                width: double.infinity,
                height: 240,
                fit: BoxFit.fill,
              ),
              TitleSectionPage(),
              BuildButtonPage(),
              Text(
                  '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.          ''')
            ],
          )),
    );
  }
}

class TitleSectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TitleSection("这是名称", '这里是描述', 55);
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String desc;
  final int count;

  _TitleSection(this.title, this.desc, this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration2(),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
//      color: Colors.lightGreenAccent[100],
      padding: EdgeInsets.all(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(desc),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.redAccent,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text(count.toString()),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.lightGreenAccent,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.elliptical(50, 80),
      ),
    );
  }

  var imageUrl =
      'https://images.unsplash.com/photo-1562101660-c49dd4bc0083?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';

  BoxDecoration buildBoxDecoration2() {
    return BoxDecoration(
      color: Colors.lightGreenAccent,
      border: Border.all(color: Colors.cyanAccent[100]),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.fill,
      ),
    );
  }
}

class BuildButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(context, Icons.call, 'CALL'),
        _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, Icons.share, 'SHARE'),
      ],
    );
  }

  _buildButtonColumn(BuildContext context, IconData icon, String content) {
    var color = Theme.of(context).primaryColor;
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 30),
          child: Text(
            content,
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}

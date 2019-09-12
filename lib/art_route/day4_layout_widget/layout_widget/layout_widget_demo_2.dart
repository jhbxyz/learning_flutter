import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum BuildingType { theater, restaurant }

class BuildingBean {
  BuildingBean(this.type, this.name, this.address);

  final BuildingType type;
  final String name;
  final String address;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var beansData = getBeansData();

    return MaterialApp(
      title: 'BuildListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BuildListView'),
        ),
        body: BuildListView(
            beansData, (position) => debugPrint(' position = $position')),
      ),
    );
  }
}

List<BuildingBean> getBeansData() {
  var list = List<BuildingBean>();
  for (var i = 0; i < 10; i++) {
    list.add(BuildingBean(BuildingType.theater, "Titlie$i", '$i'));
  }
  return list;
}

typedef OnTabListener = void Function(int position);

class BuildListView extends StatelessWidget {
  final OnTabListener listener;
  final List<BuildingBean> beans;

  BuildListView(this.beans, this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemView(index, beans[index], listener);
      },
      itemCount: beans.length,
    );
  }
}

class ItemView extends StatelessWidget {
  final int position;
  final BuildingBean bean;
  final OnTabListener listener;

  ItemView(this.position, this.bean, this.listener);

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      bean.type == BuildingType.theater ? Icons.theaters : Icons.restaurant,
      color: Colors.cyan,
    );

    var row = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: icon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                bean.name,
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              Text(bean.address),
            ],
          ),
        ),
      ],
    );

    return InkWell(
      child: row,
      onTap: () {
        listener(position);
      },
    );
  }
}

import 'package:flutter/material.dart';

void main()=>runApp(ShowViewPage());

class ShowViewPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          child: Text('Hello'),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
        ),
      ),
    );
  }
}
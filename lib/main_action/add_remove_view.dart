import 'package:flutter/material.dart';

void main() {
  runApp(AddRemoveApp());
}

class AddRemoveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add View or Remove View',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: AddRemovePage(),
    );
  }
}

class AddRemovePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRemovePageState();
  }
}

class _AddRemovePageState extends State<AddRemovePage> {
  var toggle = true;
  var urlImage = 'https://images.unsplash.com/photo-1567721537939-868edb6564a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';

  Widget _changeContent() {
    if (toggle) {
      return Image.network(urlImage);
    } else {
      return RaisedButton(
        child: Text('tow'),
        onPressed: (){
          debugPrint('哈哈哈');
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Center(
        child: _changeContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeToggle,
      ),
    );
  }

  void _changeToggle() {

    setState(() {
      toggle = !toggle;

    });

  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListViewPage',
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      home: _ListViewPage(),
    );
  }
}

class _ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<_ListViewPage> {
  var items = List<int>.generate(20, (i) => i);
  var mIsRequest = false;
  var _scrollControl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollControl.addListener(() {
      if (_scrollControl.position.pixels ==
          _scrollControl.position.maxScrollExtent) _getMoreData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview  loading'),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return ListTile(
              title: Text('Number $index'),
            );
          }
        },
        controller: _scrollControl,
      ),
    );
  }

  void _getMoreData() async {
    if (!mIsRequest) {
      setState(() {
        mIsRequest = true;
      });

      var newEntries = await _fakeRequest(items.length, items.length + 10);
      if (newEntries.isEmpty) {
        var edge = 50.0;
        var offsetFromBottom = _scrollControl.position.maxScrollExtent -
            _scrollControl.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollControl.animateTo(
              _scrollControl.offset - (edge - offsetFromBottom),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }

      setState(() {
        items.addAll(newEntries);
        mIsRequest = false;
      });
    }
  }

  Future<List<int>> _fakeRequest(int from, int to) async {
    return Future<List<int>>.delayed(Duration(seconds: 2), () {
      if (items.length >= 29) {
        return List<int>();
      }
      return List<int>.generate((to - from), (i) => i + from);
    });
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: mIsRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

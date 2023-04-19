import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
  

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutterサンプル';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: this.title,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    required this.title,
  }) : super();
    
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
class Data {
  int _price;
  String _name;
  Data(this._name, this._price): super();
  
  @override
  String toString() {
    return _name + ':' + _price.toString() + '円';
  }
}
  
class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  static final _data = [
    Data('Apple', 200),
    Data('Orange', 150),
    Data('Peach', 300)
  ];
  Data _item = _data[0];

  void _setData() {
    setState(() {
      _item = (_data..shuffle()).first;
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Text(
          _item.toString() + '$_count',
          style: TextStyle(fontSize: 32.0)
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _setData,
          tooltip: 'set data.',
          child: Icon(Icons.star),
        ),
      );
  }
}

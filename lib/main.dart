import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
       
      
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
     appBar: AppBar(title: const Text('Tasks - Bottom App Bar')),
    floatingActionButton: FloatingActionButton.extended(
      elevation: 4.0,
      icon: const Icon(Icons.add),
      label: const Text('Add a task'),
      onPressed: () {},
    ),
    floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      hasNotch: false,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
    ),
   
    );
  }
}

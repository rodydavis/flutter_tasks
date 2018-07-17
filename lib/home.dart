import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'add_task.dart';
import 'task.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home/tasks';
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _MyHomePageState extends State<MyHomePage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 75.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.snapping;

  @override
  void initState() {
    super.initState();
  }

  List<Task> _items = [];

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_items[index].title),
      subtitle:
          _items[index].subtitle.isEmpty ? null : Text(_items[index].subtitle),
      leading: IconButton(
        icon: Icon(Icons.radio_button_unchecked),
        onPressed: () {
          _removeItem(index);
        },
      ),
    );
  }

  void _addItem(String id, String title, String subtitle) {
    setState(() {
      _items.add(
        Task(id: id, title: title, subtitle: subtitle),
      );
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              brightness: Brightness.light,
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              title: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'My Tasks',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                  ),
                ),
              ),
              titleSpacing: 20.0,
              centerTitle: false,
              elevation: 6.0,
              backgroundColor: Colors.white,
            ),
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildItem(context, index);
                },
                childCount: _items.length == null ? 0 : _items.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task'),
        onPressed: () {
          showModalBottomSheet<Task>(
              context: context,
              resizeToAvoidBottomPadding: true,
              builder: (BuildContext context) {
                return AddTaskWidget();
              }).then((newTask) {
            if (newTask.title.isNotEmpty)
              _addItem('${_items.length}', newTask.title, newTask.subtitle);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          hasNotch: false,
          child: SafeArea(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}

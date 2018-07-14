import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:native_widgets/native_widgets.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddTaskPageState createState() => new _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text('Save Task'),
        onPressed: () async {
          // await DataBase.addItem('${items.length}', 'Test', 'Sub Title');
          Navigator.pop(context);
        },
      ),
    );
  }
}

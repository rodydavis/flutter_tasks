import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class AddTaskWidget extends StatefulWidget {
  @override
  AddTaskWidgetState createState() => AddTaskWidgetState();
}

class AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerDetails = TextEditingController();
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();
    _showDetails = false;
    _controller.clear();
    _controllerDetails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'New task',
              ),
              autofocus: true,
            ),
            _showDetails
                ? TextField(
                    controller: _controllerDetails,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add details',
                    ),
                  )
                : Container(
                    height: 0.0,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _showDetails = true;
                    });
                  },
                ),
                FlatButton(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context,
                        Task(
                          title: _controller.text.toString(),
                          subtitle: _controllerDetails.text.toString(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

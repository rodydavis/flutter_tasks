import 'package:flutter/material.dart';
import 'package:flutter_tasks/tasks.dart';

import 'add_task.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: const FirebaseOptions(
      googleAppID: '1:79601577497:ios:5f2bcc6ba8cecddd',
      gcmSenderID: '79601577497',
      apiKey: 'AIzaSyArgmRGfB5kiQT6CunAOmKRVKEsxKmy6YI-G72PVU',
      projectID: 'flutter-firestore',
    ),
  );
  final Firestore firestore = new Firestore(app: app);

  runApp(new MaterialApp(
    title: 'Tasky App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(firestore: firestore),
    routes: {
      '/add_task': (context) => AddTaskPage(),
    },
  ));
}

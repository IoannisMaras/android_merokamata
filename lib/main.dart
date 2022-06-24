import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'Classes/HiveBoxes.dart';
import 'DemoApp.dart';

late Box box;

void main() async {
  var path = Directory.current.path;
  Hive.init(path);
  box = await Hive.openBox('EventsBox');
  Hive.registerAdapter(EventsBoxAdapter());
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

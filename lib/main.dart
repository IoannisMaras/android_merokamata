import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'Classes/HiveBoxes.dart';
import 'DemoApp.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';

//late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) PathProviderAndroid.registerWith();

  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  //box = await Hive.openBox('EventsBox');
  //Hive.registerAdapter(EventsBoxAdapter());
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

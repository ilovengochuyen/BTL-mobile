import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'BTL-mobile',
    options: Platform.isIOS || Platform.isMacOS ?
        FirebaseOptions(
            apiKey: 'AIzaSyCbVwrgwb7EefeqQs8kFP1-otQRi9OPIW8',
            appId: 'IOS KEY',
            messagingSenderId: '34841902852',
            projectId: 'fluttercomico'
        )
        :
    FirebaseOptions(
        apiKey: 'AIzaSyCbVwrgwb7EefeqQs8kFP1-otQRi9OPIW8',
        appId: '1:34841902852:android:b6b66efd5ab575d2a49a51',
        messagingSenderId: '34841902852',
        projectId: 'fluttercomico'
    )
  );
  runApp(/*const*/ ProviderScope(child: MyApp(app: app)));
}

class MyApp extends StatelessWidget {
  FirebaseApp app;
  MyApp({required this.app});
  //const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

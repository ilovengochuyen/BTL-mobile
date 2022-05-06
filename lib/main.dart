import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'start',
      title: 'manga',
      routes: {
        'login': (context) => LoginPage(),
        'register': (context) => myRegister(),
        'forgot': (context) => resetPassword(),
        'signup': (context) => SignupPage(),
        'start': (context) => StartScreen(),
      },
    ),
  );
}
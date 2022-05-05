import 'package:flutter/material.dart';
import 'package:manga/screens/login.dart';
import 'package:manga/screens/register.dart';
import 'package:manga/screens/resetpass.dart';
import 'package:manga/screens/signup.dart';
import 'package:manga/screens/startScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'start',
      title: 'OMS',
      routes: {
        'login': (context) => LoginPage(),
        'register': (context) => myRegister(),
        'forgot': (context) => resetPassword(),
        'signup': (context) => SignupPage(),
        'start': (context) => startScreen(),
      },
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:manga/screens/login.dart';
import 'package:manga/screens/register.dart';
import 'package:manga/screens/resetpass.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'OMS',
      routes: {
        'login': (context) => myLogin(),
        'register': (context) => myRegister(),
        'forgot': (context) => resetPassword(),
      },
    ),
  );
}
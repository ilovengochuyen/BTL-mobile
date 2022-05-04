import 'package:flutter/material.dart';
import 'package:manga/login.dart';
import 'package:manga/register.dart';
import 'package:manga/resetpass.dart';

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
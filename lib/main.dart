
import 'package:flutter/material.dart';
import 'package:oms/login.dart';
import 'package:oms/register.dart';
import 'package:oms/resetpass.dart';
import 'package:oms/signup.dart';
import 'package:oms/userprofile.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'MANGA',
      routes: {
        'login': (context) => myLogin(),
        'Register': (context) => myRegister(),
        'forgot': (context) => resetPassword(),
        'signup': (context) => SignupPage(),
        'profile': (context) => UserProfile(),
        //'profileEdit': (context) =>
      },
    ),
  );
}


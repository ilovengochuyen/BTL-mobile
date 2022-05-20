import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga/providers/banner_provider.dart';
import 'package:manga/providers/chapter_provider.dart';
import 'package:manga/providers/comic_provider.dart';
import 'package:manga/providers/UserID.dart';
import 'package:manga/providers/follow_comic_provider.dart';
import 'package:manga/providers/product_provider.dart';
import 'package:manga/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  String a = "123456";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //String  a;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ComicProvider>(create: (context)=>ComicProvider()),
        ChangeNotifierProvider<ChapterProvider>(create: (context)=>ChapterProvider()),
        ChangeNotifierProvider<BannerProvider>(create: (context)=>BannerProvider()),
        ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider()),
        ChangeNotifierProvider<FollowComicProvider>(create: (context)=>FollowComicProvider()),
        ChangeNotifierProvider<ProductProvider>(create: (context)=>ProductProvider()),
      ],
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'start',
          title: 'manga',
          routes: {
            'login': (context) => const LoginPage(),
            'register': (context) => const myRegister(),
            'forgot': (context) => const resetPassword(),
            'signup': (context) => const SignupPage(),
            'start': (context) => const StartScreen(),
            'comic_home_screen': (context) => const ComicHomeScreen(),
          },
        )
    );

  }
}

/*
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
}*/

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'untitled4',
    options: Platform.isIOS || Platform.isMacOS ?
        const FirebaseOptions(
            apiKey: 'AIzaSyCbVwrgwb7EefeqQs8kFP1-otQRi9OPIW8',
            appId: 'IOS KEY',
            messagingSenderId: '34841902852',
            projectId: 'fluttercomico'
        )
        :
    const FirebaseOptions(
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
      home: MyHomePage(title: 'Comico', app: app),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.app}) : super(key: key);

  final FirebaseApp app;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _bannerRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: deprecated_member_use
    final FirebaseDatabase _database = FirebaseDatabase(app:widget.app);
    _bannerRef = _database.ref().child('Banners');
  }

  // Future getImgFromFirebase() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await firestore.collection("Banners").get();
  //   return a
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.title,
                    style: const TextStyle(color: Colors.white)
        ),
      ),
      body: FutureBuilder<List<String>> (
        future: getBanners(_bannerRef),
        builder: (context,snapshot) {
          if(snapshot.hasData) {

            return Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CarouselSlider(items: snapshot.data?.map((e) =>
                                Builder(
                                  builder: (context) {
                                  return Image.network(e,fit:BoxFit.cover);
                                },
                            )).toList(),
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 1,
                                            initialPage: 0,
                                            height: MediaQuery.of(context).size.height/3
                                          ))
                          ],);
          } else if(snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'),);
          }
          return const Center(child: CircularProgressIndicator(),);
        }, //builder
      ),
    );
  }


  Future<List<String>> getBanners(DatabaseReference bannerRef) {
    return bannerRef.once().then((snapshot) => snapshot.value.cast<String>().toList());

    //return bannerRef.once().then((snapshot) => snapshot.value.cast<String>().toList());
  }
}

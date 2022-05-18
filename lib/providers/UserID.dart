import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/ComicModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
    User? _userId = FirebaseAuth.instance.currentUser;

    getUser() => _userId;
    setUser(User userId) => _userId = userId;

    getUserName () async{
      String x = "";
      await FirebaseFirestore.instance
      .collection("users")
      .doc(_userId!.uid).get()
      .then((value) async{//x = value.get("username");
                print("Fetchedd ==>>> ${value.get("username")}" );
                await {x= value.get("username")};
                print(x);
                //return x;
          } 
      );
      print(x);
      return x;
    }
}

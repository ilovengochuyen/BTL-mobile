import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FollowComicProvider with ChangeNotifier {

  void addFollowComicData({
    String? id,
    String? name,
    String? image,
    String? description,
  }) async {
    FirebaseFirestore.instance
        .collection("FollowComic")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourFollowComic")
        .doc(id)
        .set(
      {
        "id":id,
        "name":name,
        "image":image,
        "description":description
      },
    );
  }
}
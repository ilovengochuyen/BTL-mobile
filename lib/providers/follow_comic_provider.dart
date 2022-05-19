import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/FollowComicModel.dart';

class FollowComicProvider with ChangeNotifier {
  void addFollowComicData({
    String? followId,
    String? followName,
    String? followImage,
    String? followDescription,
  }) async {
    FirebaseFirestore.instance
        .collection("FollowComic")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourFollowComic")
        .doc(followId)
        .set(
      {
        "id":followId,
        "name":followName,
        "image":followImage,
        "description":followDescription
      },
    );
  }

  List<FollowComicModel> followComicDataList = [];
  void getFollowComicData() async {
    List<FollowComicModel> newList=[];
    QuerySnapshot followDataValue = await FirebaseFirestore.instance
        .collection("FollowComic")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourFollowComic")
        .get();
    followDataValue.docs.forEach((element) {
      FollowComicModel followComicModel = FollowComicModel(
          followImage: element.get("image"),
          followName: element.get("name"),
          followDescription: element.get("description"),
          followId: element.get("id"));
      newList.add(followComicModel);
    });
    followComicDataList = newList;
    notifyListeners();
  }

  List<FollowComicModel> get getFollowComicList {
    return followComicDataList;
  }
}
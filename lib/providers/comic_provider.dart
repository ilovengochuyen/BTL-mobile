import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/model/ComicModel.dart';

class ComicProvider with ChangeNotifier {
  List<ComicModel> newestComicList = [];
  ComicModel comicModel = new ComicModel(image: ' ', name: ' ');

  fatchNewestComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("NewestComic").get();

    value.docs.forEach((element) {
      //print(element.data());
      comicModel = ComicModel(
          image: element.get("image"),
          name: element.get("name")
      );
      newList.add(comicModel);
    },
    );
    newestComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getNewestComicDataList {
    return newestComicList;
  }
}
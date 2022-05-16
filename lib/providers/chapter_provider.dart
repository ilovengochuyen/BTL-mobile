import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/ChapterModel.dart';

class ChapterProvider with ChangeNotifier {
  List<ChapterModel> chapterList = [];
  ChapterModel chapterModel = new ChapterModel(image: ' ', name: ' ', description: '');

  fatchChapterData() async {
    List<ChapterModel> newList = [];

    QuerySnapshot value = await FirebaseFirestore.instance.collection("NewestComic").get();
    value.docs.forEach((element) {
      print(element.data());
      chapterModel = ChapterModel(
          image: element.get("image"),
          name: element.get("name"),
          description: element.get("description"),
      );
      newList.add(chapterModel);
    },
    );
    chapterList = newList;
    notifyListeners();
  }

  List<ChapterModel> get getchapterList {
    return chapterList;
  }
}
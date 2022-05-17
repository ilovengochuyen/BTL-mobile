import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/ChapterModel.dart';

class ChapterProvider with ChangeNotifier {

  ChapterModel chapterModel = new ChapterModel(image: ' ', name: ' ', description: '', chapterPage: []);

  /**********************************************
   **********List Jujutsu no Kaisen Chapters*************
   *************************************************/

  List<ChapterModel> chapterJujutsuKaisenList = [];
  fatchJujutsuKaisenListChapterData() async {
    List<ChapterModel> newList = [];

    QuerySnapshot value = await FirebaseFirestore.instance.collection("NewestComic")
        .doc('JujutsuKaisen')
        .collection('JujutsuKaisenChapters')
        .get();
    value.docs.forEach((element) {
      print(element.data());
      chapterModel = ChapterModel(
        image: element.get("image"),
        name: element.get("name"),
        description: element.get("description"),
        chapterPage: element.get("chapterPage"),
      );
      newList.add(chapterModel);
    },
    );
    chapterJujutsuKaisenList = newList;
    notifyListeners();
  }

  List<ChapterModel> get getJujutsuKaisenList {
    return chapterJujutsuKaisenList;
  }


}
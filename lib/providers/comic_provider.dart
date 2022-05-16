import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/ComicModel.dart';

class ComicProvider with ChangeNotifier {

  ComicModel comicModel = new ComicModel(image: ' ', name: ' ', genres: '', description: '', author: '');
  List<ComicModel> search=[];
  comicModels(QueryDocumentSnapshot element) {
    comicModel = ComicModel(
        image: element.get("image"),
        name: element.get("name"),
        description: element.get("description"),
        genres: element.get("genres"),
        author: element.get("author")
    );
    search.add(comicModel);
  }




  /*List Newest Comic Model*/
  List<ComicModel> newestComicList = [];
  fatchNewestComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("NewestComic").get();

    value.docs.forEach((element) {
      print(element.data());
      comicModels(element);
      newList.add(comicModel);
    },
    );
    newestComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getNewestComicDataList {
    return newestComicList;
  }

  /*Search*/
  List<ComicModel> get getAllSearchItem {
    return search;
  }
}
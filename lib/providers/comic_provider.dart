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


  /**********************************************
  **********List Newest Comic Model*************
   *************************************************/

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

  /**********************************************
   **********List Hottest Comic Model*************
   *************************************************/

  List<ComicModel> hottestComicList = [];
  fatchHottestComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("HottestComic").get();

    value.docs.forEach((element) {
      print(element.data());
      comicModels(element);
      newList.add(comicModel);
    },
    );
    hottestComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getHottestComicDataList {
    return hottestComicList;
  }

  /**********************************************
   **********List Action Comic Model*************
   *************************************************/

  List<ComicModel> actionComicList = [];
  fatchActionComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("ActionComic").get();

    value.docs.forEach((element) {
      print(element.data());
      comicModels(element);
      newList.add(comicModel);
    },
    );
    actionComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getActionComicDataList {
    return actionComicList;
  }

  /**********************************************
   **********List Slice of Life Comic Model*************
   *************************************************/

  List<ComicModel> solComicList = [];
  fatchSoLComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("SliceOfLifeComic").get();

    value.docs.forEach((element) {
      print(element.data());
      comicModels(element);
      newList.add(comicModel);
    },
    );
    solComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getSoLComicDataList {
    return solComicList;
  }

  /**********************************************
   **********List Romantic Comic Model*************
   *************************************************/

  List<ComicModel> romanticComicList = [];
  fatchRomanticComicData() async {
    List<ComicModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("RomaticComic").get();

    value.docs.forEach((element) {
      print(element.data());
      comicModels(element);
      newList.add(comicModel);
    },
    );
    romanticComicList = newList;
    notifyListeners();
  }

  List<ComicModel> get getRomanticComicDataList {
    return romanticComicList;
  }


  /**********************************************
   **********Search*************
   *************************************************/
  List<ComicModel> get getAllSearchItem {
    return search;
  }
}
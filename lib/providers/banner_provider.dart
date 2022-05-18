import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/BannerModel.dart';

class BannerProvider with ChangeNotifier {

  BannerModel bannerModel = new BannerModel(image: ' ');

  List<BannerModel> banner = [];
  fatchBannerData() async {
    List<BannerModel> newList = [];

    QuerySnapshot value = await FirebaseFirestore.instance.collection("Banner").get();
    value.docs.forEach((element) {
      print(element.data());
      bannerModel = BannerModel(
        image: element.get("image")
      );
      newList.add(bannerModel);
    },
    );
    banner = newList;
    notifyListeners();
  }

  List<BannerModel> get getBanner {
    return banner;
  }


}
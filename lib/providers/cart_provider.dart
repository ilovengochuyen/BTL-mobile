import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/CartModel.dart';

class CartProvider with ChangeNotifier {
  void addCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartDescription,
  }) async {
    FirebaseFirestore.instance
        .collection("CartProduct")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartProduct")
        .doc(cartId)
        .set(
      {
        "id":cartId,
        "name":cartName,
        "image":cartImage,
        "description":cartDescription
      },
    );
  }

  List<CartModel> cartList = [];
  void getCartData() async {
    List<CartModel> newList=[];
    QuerySnapshot cartDataValue = await FirebaseFirestore.instance
        .collection("CartProduct")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCartProduct")
        .get();
    cartDataValue.docs.forEach((element) {
      CartModel cartModel = CartModel(
          cartImage: element.get("image"),
          cartName: element.get("name"),
          cartDescription: element.get("description"),
          cartId: element.get("id"));
      newList.add(cartModel);
    });
    cartList = newList;
    notifyListeners();
  }

  List<CartModel> get getCartList {
    return cartList;
  }
}

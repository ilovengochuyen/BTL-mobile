import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/ProductModel.dart';

class ProductProvider with ChangeNotifier {
  ProductModel productModel = new ProductModel(productId: '',
      productImage: '', productName: '',
      productPrice: 0, productDescription: '');

  productModels(QueryDocumentSnapshot element) {

    productModel = ProductModel(
      productImage: element.get("image"),
      productName: element.get("name"),
      productPrice: element.get("price"),
      productId: element.get("id"),
      productDescription: element.get('description'),
    );
  }

  /**********************************************
   **********List Nendroid Product*************
   *************************************************/
  List<ProductModel> nendroidList = [];

  fatchNendroidProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("NendroidProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    nendroidList = newList;
    notifyListeners();
  }

  List<ProductModel> get getNendroidDataList {
    return nendroidList;
  }



}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manga/model/CartModel.dart';
import 'package:manga/model/DeliveryModel.dart';


class CheckoutProvider with ChangeNotifier {
  bool isloadding = false;

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController hamlet = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController town = TextEditingController();

  void validator(context, myType) async {
    if (name.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục tên đang bỏ trống");
    } else if (phoneNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục số điện thoại đang bỏ trống");
    } else if (hamlet.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục Xã/Phường đang bỏ trống");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục Số nhà, Đường đang bỏ trống");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục Tỉnh/Thành phố đang bỏ trống");
    } else if (town.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mục Quận/Huyện đang bỏ trống");
    } else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliverAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "name": name.text,
        "phoneNumber": phoneNumber.text,
        "hamlet": hamlet.text,
        "street": street.text,
        "city": city.text,
        "town": town.text,
        "addressType": myType.toString(),
      }).then((value) async {
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Thêm địa chỉ");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryModel> deliveryAdressList = [];
  getDeliveryAddressData() async {
    List<DeliveryModel> newList = [];

    DeliveryModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryModel(
        name : _db.get("name"),
        phoneNumber: _db.get("phoneNumber"),
        hamlet: _db.get("hamlet"),
        addressType: _db.get("addressType"),
        city: _db.get("city"),
        town: _db.get("town"),
        street: _db.get("street"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryModel> get getDeliveryAddressList {
    return deliveryAdressList;
  }

////// Order /////////
  addPlaceOderData({
    List<CartModel>? oderItemList,
    var address,
  }) async {
    FirebaseFirestore.instance
        .collection("Order")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyOrders")
        .doc()
        .set(
      {
        "orderItems": oderItemList
            ?.map((e) => {
          "orderTime": DateTime.now(),
          "orderImage": e.cartImage,
          "orderName": e.cartName,
          "orderPrice": e.cartPrice,
        })
            .toList(),
        // "address": address
        //     .map((e) => {
        //           "orderTime": DateTime.now(),
        //           "orderImage": e.cartImage,
        //           "orderName": e.cartName,
        //           "orderUnit": e.cartUnit,
        //           "orderPrice": e.cartPrice,
        //           "orderQuantity": e.cartQuantity
        //         })
        //     .toList(),
      },
    );
  }
}
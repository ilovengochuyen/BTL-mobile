import 'package:flutter/material.dart';
import 'package:manga/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../providers/check_provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm thông tin nhận hàng",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
          onPressed: () {
            checkoutProvider.validator(context, myType);
          },
          child: Text(
            "Thêm thông tin",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "Họ tên",
              controller: checkoutProvider.name,
            ),
            CustomTextField(
              labText: "Số điện thoại",
              controller: checkoutProvider.phoneNumber,
            ),
            CustomTextField(
              labText: "Số nhà, Đường",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: "Phường/Xã",
              controller: checkoutProvider.hamlet,
            ),
            CustomTextField(
              labText: "Quận/Huyện",
              controller: checkoutProvider.town,
            ),
            CustomTextField(
              labText: "Tỉnh/Thành phố",
              controller: checkoutProvider.city,
            ),

            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Loại địa chỉ"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Nhà riêng"),
              onChanged: (value) {
                setState(() {
                  myType = value as AddressTypes;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Colors.deepOrange,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Nơi làm việc"),
              onChanged: (value) {
                setState(() {
                  myType = value as AddressTypes;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Colors.deepOrange,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Nơi khác"),
              onChanged: (value) {
                setState(() {
                  myType = value as AddressTypes;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
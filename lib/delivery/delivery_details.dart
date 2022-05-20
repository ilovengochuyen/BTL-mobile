import 'package:flutter/material.dart';
import 'package:manga/delivery/payment.dart';
import 'package:manga/delivery/single_delivery.dart';
import 'package:manga/model/DeliveryModel.dart';
import 'package:provider/provider.dart';

import '../providers/check_provider.dart';
import 'add_delivery_details.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin thanh toán"),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliverAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          textColor: Colors.white,
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("Thêm địa chỉ mới")
              : Text("Thanh toán"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliverAddress(),
              ),
            )
                : Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentSummary(
                  deliverAddressList: value,
                ),
              ),
            );
          },
          color: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Chuyển tới"),
            leading: Icon(Icons.location_on),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Center(
            child: Container(
              child: Center(
                child: Text("Không có dữ liệu"),
              ),
            ),
          )
              : Column(
            children: deliveryAddressProvider.getDeliveryAddressList
                .map<Widget>((e) {
              setState(() {
                value  = e;
              });
              return SingleDeliveryItem(
                address:
                "Số nhà, Đường, ${e.street}, Xã/Phường, ${e.hamlet}, Quận/Huyện ${e.town}, Tỉnh/Thành Phố ${e.city}",
                title: "${e.name}",
                number: e.phoneNumber,
                addressType: e.addressType == "AddressTypes.Home"
                    ? "Nhà"
                    : e.addressType == "AddressTypes.Other"
                    ? "Khác"
                    : "Nơi làm việc",
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
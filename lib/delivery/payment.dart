import 'package:flutter/material.dart';
import 'package:manga/delivery/single_delivery.dart';
import 'package:manga/model/DeliveryModel.dart';
import 'package:manga/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../cart/order_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryModel deliverAddressList;
  PaymentSummary({required this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thanh toán",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBar: ListTile(
        title: Text("Tổng tiền"),
        subtitle: Text(
          "${cartProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              // myType == AddressTypes.OnlinePayment
              //     ? Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => MyGooglePay(
              //             total: total,
              //           ),
              //         ),
              //       )
              //     : Container();

            },
            child: Text(
              "Đặt hàng",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                  "Số nhà, Đường, ${widget.deliverAddressList.street}, Xã/Phường, ${widget.deliverAddressList.hamlet}, Quận/Huyện ${widget.deliverAddressList.town}, Tỉnh/Thành Phố ${widget.deliverAddressList.city}",
                  title:
                  "${widget.deliverAddressList.name}",
                  number: widget.deliverAddressList.phoneNumber,
                  addressType: widget.deliverAddressList.addressType ==
                      "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList.addressType ==
                      "AddressTypes.Other"
                      ? "Other"
                      : "Work",
                ),
                //Divider(),
                ExpansionTile(
                  children: cartProvider.getCartList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Sản phẩm ${cartProvider.getCartList.length}"),
                ),
                Divider(),

                ListTile(
                  leading: Text("Loại thanh toán"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: Text("Nhà riêng"),
                  onChanged: (value) {
                    setState(() {
                      myType = value as AddressTypes ;
                    });
                  },
                  secondary: Icon(
                    Icons.work,
                    color: Colors.deepOrange,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("Trực tuyến"),
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
            );
          },
        ),
      ),
    );
  }
}
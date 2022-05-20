import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  SingleDeliveryItem({required this.title,
    required this.addressType,
    required this.address, required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: const EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.deepOrange, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    addressType,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: const CircleAvatar(
            radius: 8,
            backgroundColor:Colors.deepOrange,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              const SizedBox(
                height: 5,
              ),
              Text(number),
            ],
          ),
        ),
        const Divider(
          height: 35,
        ),
      ],
    );
  }
}
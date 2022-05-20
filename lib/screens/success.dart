
import 'package:flutter/material.dart';

class Sucess extends StatelessWidget {
  const Sucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Đặt hàng thành công",
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
        ),
      )
    );
  }
}

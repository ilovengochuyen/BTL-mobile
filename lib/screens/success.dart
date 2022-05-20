
import 'package:flutter/material.dart';

class Sucess extends StatelessWidget {
  const Sucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tình trạng", style: TextStyle(fontSize: 18),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Text(
            "Đặt hàng thành công",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
    );

  }
}

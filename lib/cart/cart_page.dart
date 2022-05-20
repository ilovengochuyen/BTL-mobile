import 'package:flutter/material.dart';
import 'package:manga/model/CartModel.dart';
import 'package:manga/model/FollowComicModel.dart';
import 'package:manga/providers/cart_provider.dart';
import 'package:manga/providers/follow_comic_provider.dart';
import 'package:manga/widgets/single_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Sản phẩm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: cartProvider.getCartList.length,
          itemBuilder: (context, index) {
            CartModel data = cartProvider.getCartList[index];
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SingleItem(isBool: false,
                    name: data.cartName,
                    image: data.cartImage,
                    description: data.cartDescription,
                    onTap: () {},
                    chapterPage: []),
              ],
            );
          }),
      bottomNavigationBar: ListTile(
        title: Text("Tổng tiền"),
        subtitle: Text(
          "${cartProvider.getTotalPrice()} VND",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
              child: Text("Mua", style: TextStyle(color: Colors.white),),
              color: Colors.deepOrange,
              onPressed: (){}
          ),
        ),
      ),
    );
  }
}

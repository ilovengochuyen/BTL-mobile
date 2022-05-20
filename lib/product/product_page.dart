import 'package:flutter/material.dart';
import 'package:manga/providers/cart_provider.dart';
import 'package:manga/providers/follow_comic_provider.dart';
import 'package:manga/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int price;
  final String id;

  ProductPage({required this.image,
    required this.name,
    required this.description,
    required this.id, required this.price});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.deepOrange,

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.image),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.deepOrange,
                        child: Center(
                          child: Text(widget.name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Container(
                          child: Text(widget.price.toString() + " VND",
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.red, fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10,),
                    Container(
                      height: 75,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Expanded(
                          child: SingleChildScrollView(
                            //color: Colors.red,
                            scrollDirection: Axis.vertical,
                            child: Text(widget.description),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            cartProvider.addCartData(
              cartName: widget.name,
              cartDescription: widget.description,
              cartImage: widget.image,
              cartId: widget.id,
              cartPrice: widget.price
            );
          },
          child: const Text("Thêm vào giỏ hàng"),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            minimumSize: const Size(50, 50),
          ),

    ),
    );
  }
}

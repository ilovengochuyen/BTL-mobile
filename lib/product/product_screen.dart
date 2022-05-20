import 'package:flutter/material.dart';
import 'package:manga/product/product_page.dart';
import 'package:manga/comic/single_comic.dart';
import 'package:manga/providers/product_provider.dart';
import 'package:manga/search/search.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}


class _ProductScreenState extends State<ProductScreen> {
  ProductProvider productProvider = ProductProvider();

  Widget _buildNendroidProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://i.pinimg.com/564x/cc/5c/f4/cc5cf4bcb8260e2e9d0d19bab800328d.jpg"),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sản phẩm mô hình Nendroid',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getNendroidDataList
                .map((data) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(image: data.productImage,
                          name: data.productName, description: data.productDescription,
                           id: data.productId, price: data.productPrice,),
                    ),
                  );},
                image: data.productImage,
                name: data.productName,
              );
            })
                .toList(),
          ),
        ),
      ],
    );
  }


  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchNendroidProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Sản phẩm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(search: comicProvider.getAllSearchItem,),),);
              },
              icon: const Icon(Icons.search, size: 17, color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [

            _buildNendroidProduct(context),
          ],
        ),
      ),
    );
  }
}



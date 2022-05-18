import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:home_screen/screen/cart/cart.dart';
import 'package:manga/comic/comic_page.dart';
import 'package:manga/providers/banner_provider.dart';
import 'package:manga/providers/comic_provider.dart';
import 'package:manga/comic/single_comic.dart';
import 'package:manga/screens/comics_screen.dart';
import 'package:manga/screens/screens.dart';
import 'package:manga/search/search.dart';
import 'package:provider/provider.dart';

import '../widgets/reusable_widget.dart';


class ComicHomeScreen extends StatefulWidget {
  const ComicHomeScreen({Key? key}) : super(key: key);

  @override
  State<ComicHomeScreen> createState() => _ComicHomeScreenState();
}


class _ComicHomeScreenState extends State<ComicHomeScreen> {
  ComicProvider comicProvider = ComicProvider();
  BannerProvider bannerProvider = BannerProvider();

  Widget _buildCarouselSlider(context) {
    bannerProvider = Provider.of(context);
    return CarouselSlider(
      items: bannerProvider.getBanner
          .map((data) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 120,
            //padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                    data.image,
                  ),
                  fit: BoxFit.fill
              ),
            ),
          ),
        );
      })
          .toList(), options: CarouselOptions(),
    );
  }

  Widget _buildNewestComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mới nhất',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: comicProvider.getNewestComicDataList
                .map((newestComicData) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: newestComicData.image,
                          name: newestComicData.name, genres: newestComicData.genres, description: newestComicData.description,
                          author: newestComicData.author),
                    ),
                  );},
                image: newestComicData.image,
                name: newestComicData.name,
              );
            })
                .toList(),
          ),
        ),
      ],
    );
  }
  Widget _buildHottestComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hấp dẫn nhất',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: comicProvider.getHottestComicDataList
                .map((hottestComicData) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: hottestComicData.image,
                          name: hottestComicData.name, genres: hottestComicData.genres, description: hottestComicData.description,
                          author: hottestComicData.author),
                    ),
                  );},
                image: hottestComicData.image,
                name: hottestComicData.name,

              );
            })
                .toList(),
          ),
        ),
      ],
    );
  }
  Widget _buildActionComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hành động',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Xem tất cả',
                  style: TextStyle(
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: comicProvider.getActionComicDataList
                .map((hottestComicData) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: hottestComicData.image,
                          name: hottestComicData.name, genres: hottestComicData.genres, description: hottestComicData.description,
                          author: hottestComicData.author),
                    ),
                  );},
                image: hottestComicData.image,
                name: hottestComicData.name,

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
    ComicProvider comicProvider = Provider.of(context, listen: false);
    BannerProvider bannerProvider = Provider.of(context, listen: false);
    comicProvider.fatchNewestComicData();
    comicProvider.fatchHottestComicData();
    comicProvider.fatchActionComicData();
    bannerProvider.fatchBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    comicProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Comico',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(search: comicProvider.getAllSearchItem,),),);
                },
                icon: const Icon(Icons.search, size: 17, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(),),);
                  },
                  icon: const Icon(Icons.shop, size: 17, color: Colors.black),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              Container(
                //height: 200,
                  child: _buildCarouselSlider(context)//Carousel(),
              ),
              _buildNewestComic(context),
              _buildHottestComic(context),
              _buildActionComic(context),
            ],
          ),
        ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 14,),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15),
              )]
          ),
          child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // IconButton(onPressed: () {}, icon: Icon(Icons.home),),
                  button2("Trang chủ", const Icon(Icons.home, color: Colors.deepOrange), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ComicHomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.book)),
                  button2("Truyện tranh", const Icon(Icons.book), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ComicsScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
                  button2("Tủ sách", const Icon(Icons.account_balance), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ComicHomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  button2("Comicolours", const Icon(Icons.edit), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ComicHomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.account_circle), color: Colors.deepOrange,),
                  button2("Cá nhân", const Icon(Icons.account_circle), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
                  }),
                ],
              )
          )
      ),
    );
  }
}



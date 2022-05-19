import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manga/comic/comic_page.dart';
import 'package:manga/providers/comic_provider.dart';
import 'package:manga/comic/single_comic.dart';
import 'package:manga/screens/comics_screen.dart';
import 'package:manga/screens/screens.dart';
import 'package:manga/search/search.dart';
import 'package:provider/provider.dart';
import '../widgets/reusable_widget.dart';


class ComicolorsScreen extends StatefulWidget {
  const ComicolorsScreen({Key? key}) : super(key: key);

  @override
  State<ComicolorsScreen> createState() => _ComicolorsScreenState();
}


class _ComicolorsScreenState extends State<ComicolorsScreen> {
  ComicProvider comicProvider = ComicProvider();

  Widget _buildCannotLeftBehindComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Không thể bỏ qua',
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
            children: comicProvider.getNewestComicDataList.reversed
                .map((newestComicData) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: newestComicData.image,
                          name: newestComicData.name, genres: newestComicData.genres, description: newestComicData.description,
                          author: newestComicData.author, id: newestComicData.id
                        ,),
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
  Widget _buildOfWeekComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Truyện của tuần',
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
                          author: hottestComicData.author, id: hottestComicData.id,),
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
  Widget _buildNewComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Truyện mới',
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
            children: comicProvider.getSoLComicDataList.reversed
                .map((data) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: data.image,
                          name: data.name, genres: data.genres, description: data.description,
                          author: data.author, id: data.id,),
                    ),
                  );},
                image: data.image,
                name: data.name,

              );
            })
                .toList(),
          ),
        ),
      ],
    );
  }
  Widget _buildSupriseComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Khám phá bất ngờ',
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
            children: comicProvider.getRomanticComicDataList.reversed
                .map((data) {
              return SingleComic(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicPage(image: data.image,
                          name: data.name, genres: data.genres, description: data.description,
                          author: data.author, id: data.id,),
                    ),
                  );},
                image: data.image,
                name: data.name,

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
    comicProvider.fatchNewestComicData();
    comicProvider.fatchHottestComicData();
    comicProvider.fatchActionComicData();
    comicProvider.fatchRomanticComicData();
    comicProvider.fatchSoLComicData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    comicProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Comicolors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://i.pinimg.com/564x/a4/71/34/a471343b7c83597935236dbd22a94849.jpg"),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
            _buildCannotLeftBehindComic(context),
            _buildNewComic(context),
            _buildOfWeekComic(context),
            _buildSupriseComic(context),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ComicolorsScreen()));
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



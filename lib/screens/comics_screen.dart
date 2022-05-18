import 'package:flutter/material.dart';
import 'package:manga/comic/comic_page.dart';
import 'package:manga/providers/comic_provider.dart';
import 'package:manga/comic/single_comic.dart';
import 'package:manga/screens/screens.dart';
import 'package:manga/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../widgets/reusable_widget.dart';


class ComicsScreen extends StatefulWidget {
  const ComicsScreen({Key? key}) : super(key: key);


  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}


class _ComicsScreenState extends State<ComicsScreen> {
  ComicProvider comicProvider = new ComicProvider();
 List<bool> day = [false, false, false, false, false, false, false];
  Widget _buildT2Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: comicProvider.getNewestComicDataList
              .map((newestComicData) {
            return SingleItem(
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
              description: newestComicData.description,
              chapterPage: [],
              isBool: false,
            );
          })
              .toList(),
    );
  }
  Widget _buildT3Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getHottestComicDataList
          .map((data) {
        return SingleItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComicPage(image: data.image,
                    name: data.name, genres: data.genres, description: data.description,
                    author: data.author),
              ),
            );},
          image: data.image,
          name: data.name,
          description: data.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }
  Widget _buildT4Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getActionComicDataList
          .map((data) {
        return SingleItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComicPage(image: data.image,
                    name: data.name, genres: data.genres, description: data.description,
                    author: data.author),
              ),
            );},
          image: data.image,
          name: data.name,
          description: data.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }
  Widget _buildT5Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getNewestComicDataList.reversed
          .map((newestComicData) {
        return SingleItem(
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
          description: newestComicData.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }
  Widget _buildT6Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getActionComicDataList.reversed
          .map((newestComicData) {
        return SingleItem(
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
          description: newestComicData.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }
  Widget _buildT7Comic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getHottestComicDataList.reversed
          .map((newestComicData) {
        return SingleItem(
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
          description: newestComicData.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }
  Widget _buildCNComic(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comicProvider.getNewestComicDataList.reversed
          .map((newestComicData) {
        return SingleItem(
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
          description: newestComicData.description,
          chapterPage: [],
          isBool: false,
        );
      })
          .toList(),
    );
  }

  @override
  void initState() {
    ComicProvider comicProvider = Provider.of(context, listen: false);
    comicProvider.fatchNewestComicData();
    comicProvider.fatchHottestComicData();
    comicProvider.fatchActionComicData();
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
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      onPressed:  () {
                        day[0]=true;
                        day[1]=false;
                        day[2]=false;
                        day[3]=false;
                        day[4]=false;
                        day[5]=false;
                        day[6]=false;
                        print("true");},
                      child: Text('T2'),),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=true;
                          day[2]=false;
                          day[3]=false;
                          day[4]=false;
                          day[5]=false;
                          day[6]=false;
                          print("true");
                        },
                        child: Text('T3')),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=false;
                          day[2]=true;
                          day[3]=false;
                          day[4]=false;
                          day[5]=false;
                          day[6]=false;
                          print("true");
                        },
                        child: Text('T4')),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=false;
                          day[2]=false;
                          day[3]=false;
                          day[4]=false;
                          day[5]=true;
                          day[6]=false;
                          print("true");
                        },
                        child: Text('T5')),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=false;
                          day[2]=false;
                          day[3]=false;
                          day[4]=true;
                          day[5]=false;
                          day[6]=false;
                          print("true");
                        },
                        child: Text('T6')),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=false;
                          day[2]=false;
                          day[3]=false;
                          day[4]=false;
                          day[5]=true;
                          day[6]=false;
                          print("true");
                        },
                        child: Text('T7')),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          day[0]=false;
                          day[1]=false;
                          day[2]=false;
                          day[3]=false;
                          day[4]=false;
                          day[5]=false;
                          day[6]=true;
                          print("true");
                        },
                        child: Text('CN')),
                  ],
                ),
              ),
            ),
            day[0]==true ? Visibility(child: _buildT2Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text(""),
              visible: false,
            ),

            day[1]==true ? Visibility(child: _buildT3Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("slllllllllllllllllllllllllllllllllllllllll"),
              visible: false,
            ),

            day[2]==true ? Visibility(child: _buildT4Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("s11111111"),
              visible: false,
            ),

            day[3]==true ? Visibility(child: _buildT5Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("s11111111"),
              visible: false,
            ),

            day[4]==true ? Visibility(child: _buildT6Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("s11111111"),
              visible: false,
            ),

            day[5]==true ? Visibility(child: _buildT7Comic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("s11111111"),
              visible: false,
            ),

            day[6]==true ? Visibility(child: _buildCNComic(context),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,) : Visibility(
              child: Text("s11111111"),
              visible: false,
            ),

          ],
        ),



        /*ListView(
          children: [
            _buildNewestComic(context),
            _buildHottestComic(context),
            _buildActionComic(context),
          ],
        ),*/
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



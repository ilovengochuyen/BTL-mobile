import 'package:flutter/material.dart';
import 'package:manga/providers/chapter_provider.dart';
import 'package:manga/providers/follow_comic_provider.dart';
import 'package:provider/provider.dart';

import '../chapter/chapter_page.dart';
import '../widgets/single_item.dart';
//import 'package:manga/single_chapter.dart';

class ComicPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String genres;
  final String author;
  final String id;

  ComicPage({required this.image,
    required this.name,
    required this.description,
    required this.genres, required this.author, required this.id});

  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  ChapterProvider chapterProvider = new ChapterProvider();

  Widget _buildJujutsunoKaisenChapters(context) {
    chapterProvider = Provider.of(context);
    //ListView(
    // children: [
    return widget.name == "Chú thuật" ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chapterProvider.getJujutsuKaisenList.map((chapterData) {
        print(chapterData);
        return SingleItem(isBool: false,
          image: chapterData.image,
          name: chapterData.name,
          description:chapterData.description,
          chapterPage: chapterData.chapterPage,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChapterPages(name: chapterData.name, chapterPages: chapterData.chapterPage),),);
          },);
      }).toList(),
    ) : Container();
  }

  Widget _buildDoraemonChapters(context) {
    chapterProvider = Provider.of(context);
    //ListView(
    // children: [
    return widget.name == "Doraemon" ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chapterProvider.getDoraemonList.map((chapterData) {
        print(chapterData);
        return SingleItem(isBool: false,
          image: chapterData.image,
          name: chapterData.name,
          description:chapterData.description,
          chapterPage: chapterData.chapterPage,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChapterPages(name: chapterData.name, chapterPages: chapterData.chapterPage),),);
          },);
      }).toList(),
    ) : Container();
  }

  @override
  void initState() {
    // TODO: implement initState
    ChapterProvider chapterProvider = Provider.of(context, listen: false);
    chapterProvider.fatchJujutsuKaisenListChapterData();
    chapterProvider.fatchDoraemonChapterData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FollowComicProvider followComicProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(title: Text(widget.name), backgroundColor: Colors.deepOrange,),
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
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, right: 10, left: 10,),
                          child: Container(
                            color: Colors.grey.withOpacity(0.5),
                            height: 180,
                            //width: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      color: Colors.black,
                                      child: Text(widget.name,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      //color: Colors.red,
                                      child: Text(widget.author),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      //color: Colors.red,
                                      child: Text(widget.genres),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      //color: Colors.red,
                                      child: Text(widget.description),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(20, 10),
                                      ),
                                      child: Text("Theo dõi"),
                                      onPressed: (){
                                        followComicProvider.addFollowComicData(
                                          name: widget.name,
                                          description: widget.description,
                                          image: widget.image,
                                          id: widget.id,
                                        );
                                      },
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Danh sách chương',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
              const SizedBox(height:10,),
              _buildDoraemonChapters(context),
              _buildJujutsunoKaisenChapters(context),


            ],
          ),
        )
    );
  }
}

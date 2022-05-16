import 'package:flutter/material.dart';
import 'package:manga/providers/chapter_provider.dart';
//import 'package:manga/single_chapter.dart';

class ComicPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String genres;
  final String author;

  ComicPage({required this.image,
    required this.name,
    required this.description,
    required this.genres, required this.author});

  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  /*ChapterProvider chapterProvider = new ChapterProvider();
  Widget _buildChapterListSection(context) {*/

    //ListView(
     // children: [
        /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: chapterProvider.getchapterList.map((chapterData) {
            print(chapterData);
            return ChapterSection(image: chapterData.image,
                name: chapterData.name,
                description: chapterData.description);
          }).toList(),*/
          /*[
            ChapterSection(name: "Haruchan", image: "http://static2.minitokyo.net/view/45/00/62545.jpg", description: "Hehee",),
            ChapterSection(name: "Haruchan", image: "http://static2.minitokyo.net/view/45/00/62545.jpg", description: "Hehee",),
            ChapterSection(name: "Haruchan", image: "http://static2.minitokyo.net/view/45/00/62545.jpg", description: "Hehee",),
            ChapterSection(name: "Haruchan", image: "http://static2.minitokyo.net/view/45/00/62545.jpg", description: "Hehee",),
          ],*/
        //);
      //],
    //);

//}

  @override
  Widget build(BuildContext context) {
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

                            /*Padding(
                                  padding: EdgeInsets.only(right: 250,),
                                  child: Text('Description is one of the',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),),
                                ),*/

                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
            /*genres: "Comedy, Lovely, Cute, Funny, Adorable", description: "Haruka is the bessstttttttttttttttttttttttt"
                  "ttttttttttttttttttttttttttttttttttttttt",),*/
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Danh sách chương',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
            //_buildChapterListSection(context),

            /*Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('http://static2.minitokyo.net/view/00/23/663650.jpg'),
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
                                    child: Text('Tsubasa Chronicle',
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
                                    child: Text("Should be redddđdddddddddddddđShould be redddđdddddddddddddđ"),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    //color: Colors.red,
                                    child: Text("Should be redddđdddddddddddddđShould be redddđdddddddddddddđ"),
                                  ),
                                ),

                                *//*Padding(
                                  padding: EdgeInsets.only(right: 250,),
                                  child: Text('Description is one of the',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),),
                                ),*//*

                              ],
                            ),
                          ),
                  ),
                      )),
                ],
              ),
              ),*/
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChapterPages extends StatelessWidget {
  List<dynamic> chapterPages;
  final String name;

  ChapterPages({required this.chapterPages, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name,),backgroundColor: Colors.deepOrange,),
        body: Container(
          child: CarouselSlider(
            items: chapterPages
                .map((e) {
              return /*Container(
            child: */ClipRRect(
                //borderRadius: BorderRadius.circular(8),
                child: Image.network(e, fit:BoxFit.cover),
              );
            })
                .toList(),
            options: CarouselOptions(
              autoPlay: false,
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: false,
              viewportFraction: 1,
              initialPage: 0,
            ),
          ),
        )
    );

    //);
  }
}

import 'package:flutter/material.dart';

class ComicOverview extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String genres;

  ComicOverview({required this.image,
    required this.name,
    required this.description,
    required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
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
                  color: Colors.grey.withOpacity(0.3),
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
                            child: Text(name,
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
                            child: Text(genres, style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        /*Align(
                          alignment: Alignment.centerLeft,*/
                          /*child: */Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                    child: Text(description, style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        //),

                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

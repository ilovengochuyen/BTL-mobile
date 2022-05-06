import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleComic extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  SingleComic({
      required this.name,
      required this.image,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  /*child: Expanded(
                    flex: 7,*/
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  //),
                ),

                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            )
          ),
          ],
        ),
    );
  }

}
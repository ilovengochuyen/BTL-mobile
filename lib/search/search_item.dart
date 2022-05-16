import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
 /* final String image;
  final String name;
  final String description;

  SearchItem({required this.image,
    required this.name,
    required this.description});*/

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 80,
              //width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("http://static2.minitokyo.net/view/45/00/62545.jpg"),
                ),
              ),
              /*child: Center(
                  child: Image.network("http://static2.minitokyo.net/view/45/00/62545.jpg"),
                ),*/
            ),
          ),

        ),

        Expanded(
          flex: 2,
          child: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("name",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text("description",
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

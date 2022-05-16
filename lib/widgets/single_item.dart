import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {

  bool isBool = false;
  final String name;
  final String image;
  final String description;
  final VoidCallback onTap;

  SingleItem({required this.isBool, required this.name,
    required this.image,required this.description,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image,),
                  ),
                ),
                /*child: Center(
                  child: Image.network("http://static2.minitokyo.net/view/45/00/62545.jpg"),
                ),*/
              ),
            ),

          ),
        ),


        Expanded(
          //flex: 2,
          child: SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: isBool == false
                  ? MainAxisAlignment.spaceAround
                  :MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(description,
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        Expanded(
          flex:1,
            child: Container(
              height: 90,
              padding: isBool == false
                ? EdgeInsets.symmetric(horizontal: 15, vertical: 15)
                  : EdgeInsets.only(left: 15, right: 15),
              child: isBool==false
                ? Container(
              ): Column(
                children: [
                  SizedBox(height: 10,),
                  Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                          Text(
                            "Thêm",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
        ),
      ],
    );
  }
}

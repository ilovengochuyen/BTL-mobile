import 'package:flutter/material.dart';

GestureDetector backButton (BuildContext context, String buttonName, Function onTap) {
  return GestureDetector( 
    onTap: (){
      onTap();
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left: 0.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 194, 190, 190), width: 1.0,)
      ),
      ),
      child: Row(children: [
      SizedBox(width: 10,),
      Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.red,),
      Container(
      width: 350,
      alignment: Alignment.center,
      child: Text(
        buttonName,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
      ),
      ),

    ]),
    ),
    
  );
}
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

//Button with 2 text anh 1 arrow icon
GestureDetector button4 (BuildContext context, String buttonName, String value, Function onTap) {
  return GestureDetector( 
    onTap: (){
      onTap();
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 194, 190, 190), width: 1.0,)
      ),
      ),
      child: Row(children: [
      Container(
      child: Column(children: [

      Align(
        alignment: Alignment.topLeft,
        child:             
        Text(
        buttonName,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 10),
      ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child:       Text(
        value,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
      ),
      ),
      
      ],
      ),
      width: 200,

      ),

      SizedBox(width: 170,),
      Icon(Icons.arrow_forward_ios,
            size: 20,
            color: Colors.black,),
    ]),
    ),
    
  );
}
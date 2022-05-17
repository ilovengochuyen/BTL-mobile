import 'dart:ffi';
import 'package:manga/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/comic_home_screen.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.grey,
    style: TextStyle(color: Colors.grey.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white70.withOpacity(0.3),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      border: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none,color: Colors.grey)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, double containerHeight,  String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: containerHeight,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.redAccent;
            }
            return Colors.red;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}


IconButton reusableButton (String buttonName, Icon icon, Function onTap){
    return IconButton(
      onPressed: () {
        onTap();
      }, 
      icon: icon);

}


//button with icon 
Container button2 (String buttonName, Icon icon, Function onTap) {
  return Container(
    width: 60,
    height: 60,
    child: Column(children: [
      IconButton(
      onPressed: () {
        onTap();
      }, 
      icon: icon),
      Text(
        buttonName,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10),
      ),

    ]),
  );
}

//button with icon, text, row
GestureDetector button3 (BuildContext context, String buttonName, Icon icon, Function onTap) {
  return GestureDetector( 
    onTap: (){
      onTap();
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 194, 190, 190), width: 1.0,)
      ),
      ),
      child: Row(children: [
      icon,
      SizedBox(width: 10,),
      Container(
      width: 100,
      child: Text(
        buttonName,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13),
      ),
      ),

      SizedBox(width: 240,),
      Icon(Icons.arrow_forward_ios,
            size: 20,
            color: Colors.black,),
    ]),
    ),
    
  );
}

//square button 
Container squareButton(double containerWidth, double containerHeight,  String title, bool isRed, Function onTap) {
  return Container(
    width: containerWidth,
    height: containerHeight,
    //margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style:  TextStyle(
            color: isRed
            ? Colors.white
            : Colors.grey, 
            fontWeight: FontWeight.w500, fontSize: 13),
      ),
      style: ButtonStyle(
          backgroundColor: isRed
            ? MaterialStateProperty.all<Color>(Colors.red)
            : MaterialStateProperty.all<Color>(Colors.white),
           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)))
              ),
    ),
  );
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manga/providers/UserID.dart';
import 'package:provider/provider.dart';
import 'package:manga/widgets/button_widgets.dart';
import 'package:manga/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
   Widget build(BuildContext context) {

     final userProfile = Provider.of<UserProvider>(context);
      final user = userProfile.getUser();
      String x = "";
      //String y = FirebaseFirestore.instance.collection("user").doc(user.id).get().then((value) => null);
      // FirebaseFirestore.instance
      // .collection("users")
      // .doc(user.uid).get()
      // .then((value) {//x = value.get("username");
      //           print("Fetchedd ==>>> ${value.get("username")}" );
      //           x= value.get("username");
      //           print(x);
      //     } 
      // );
       //print("Fetchedd ==>>> ${value.get("username")}" ));
       print(x);
     return Scaffold(
       body: ListView(
         children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(children: [
                  backButton(context, "Thông tin",  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
                  }),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Color.fromARGB(255, 224, 220, 220),
                    child: Stack(
                    //fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                          
                          child: CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage("assets/uerprofile.png"),
                            ),
                      ),
                    ],
                    )
                  ),
                button4 (context, "Tên hiển thị(Nickname)", "userProfile.getUserName()", (){ 
                  print("UserId: ${userProfile.getUserName()}");
                }),
                button4(context, "Ngày sinh", "DD-MM-YY", (){

                }),
                button4(context, "UserID", "${userProfile.getUser().uid}", (){

                }),
              ])
            ),
         ],
       ),

     );

   }
}

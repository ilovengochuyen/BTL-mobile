import 'package:flutter/material.dart';
import 'package:manga/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manga/providers/UserID.dart';
import 'package:provider/provider.dart';
import 'package:manga/widgets/button_widgets.dart';
import 'package:manga/screens/screens.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
   Widget build(BuildContext context) {
     final userProfile = Provider.of<UserProvider>(context);
     return Container(
       
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

       ])
     );
   }
}
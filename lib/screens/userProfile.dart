import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga/screens/startScreen.dart';
import 'package:manga/screens/home_screen.dart';
import 'package:manga/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 110, right: 30, top: 40),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                                maxRadius: 75,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 70,
                                  backgroundImage: AssetImage("assets/uerprofile.png"),)
                            ),

                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 4,
                                          color: Theme.of(context).scaffoldBackgroundColor
                                      ),
                                      color: Colors.grey,
                                    ),

                                    child: //Icon(Icons.edit, color: Colors.white,)
                                    reusableButton("setting", Icon(Icons.edit, color: Color.fromARGB(255, 22, 20, 20),), (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                    })
                                    )),
                          ],

                        ),

                      ),

                    ],

                  ),

                ),
              ],

            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Xu",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 36, 35, 35),
            height: 35,
            width: double.infinity,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                squareButton(180, 25, "Lịch sử", false,  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    
                }),
                SizedBox(width: 10,),
                squareButton(180, 25, "Nạp xu", true,  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    
                }),
              ],
            ),
          ),
          Container(
              //padding: EdgeInsets.all(20),
              color: Color.fromARGB(171, 252, 251, 251),
              child: Row(
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      button3(context, "Truyện theo dõi", Icon(Icons.trending_up, color: Colors.grey,), () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        //
                      }),    
                      button3(context, "Thông báo", Icon(Icons.notifications_none, color: Colors.grey), () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        //
                      }),
                      button3(context, "Cài đặt", Icon(Icons.settings, color: Colors.grey), () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        //
                      }),                  
                      
                    ],
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration:
            BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                

            ),
            child: MaterialButton(
              minWidth: 200,
              height: 40,
              onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) => {
                    print("Sign out"),
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => StartScreen())),
                    });
              },
              color: Color.fromARGB(255, 216, 210, 208),
              
              //border:  Border.all(color: Color.fromARGB(255, 104, 101, 101)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color.fromARGB(255, 104, 101, 101))
              ),
              child: Text(
                "Đổi tài khoản", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromARGB(255, 104, 101, 101),
              ),
              ),

            ),


          ),

        ],

      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 14,),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              )]
          ),
          child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // IconButton(onPressed: () {}, icon: Icon(Icons.home),),
                  button2("Trang chủ", Icon(Icons.home), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.book)),
                  button2("Truyện tranh", Icon(Icons.book), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)), 
                  button2("Tủ sách", Icon(Icons.account_balance), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  button2("Comicolours", Icon(Icons.edit), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                  //IconButton(onPressed: () {}, icon: Icon(Icons.account_circle), color: Colors.deepOrange,),
                  button2("Cá nhân", Icon(Icons.account_circle), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                ],
              )
          )
      ),

    );

  }
}

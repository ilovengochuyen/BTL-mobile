import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
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
                                  backgroundImage: AssetImage("assets/userimage.png"),)
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

                                    child: Icon(Icons.edit, color: Colors.white,))),
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
              padding: EdgeInsets.all(20),
              color: Color(0xABF8EBE0),
              child: Row(
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle, size: 30),
                          SizedBox(width: 4,),
                          Text("User0001", style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height: 4, width: 4,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.mail, size: 30),
                            SizedBox(width: 4,),
                            Text("user0001@gmail.com", style: TextStyle(fontWeight: FontWeight.w500))
                          ]
                      ),
                      SizedBox(height: 4,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.circle_notifications, size: 30),
                            SizedBox(width: 4,),
                            Text("Thông báo", style: TextStyle(fontWeight: FontWeight.w500))
                          ]
                      ),
                      SizedBox(height: 4,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.feedback, size: 30),
                            SizedBox(width: 4,),
                            Text("Bạn hỏi Comico trả lời", style: TextStyle(fontWeight: FontWeight.w500))
                          ]
                      ),
                    ],
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration:
            BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border(
                )

            ),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 40,
              onPressed: () {},
              color: Color(0xffff3300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),

              ),
              child: Text(
                "Nạp xu", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.home),),
                  IconButton(onPressed: () {}, icon: Icon(Icons.book)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.account_circle), color: Colors.deepOrange,),
                ],
              )
          )
      ),

    );

  }
}
/*
Text("GXXXXXXXX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              fontSize: 20))


          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[
                Column(
                  children: <Widget> [
                    Text ("Xu:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),],
                ),
                Column(children: <Widget>[
                  Text("Nạp xu", style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ))
                ],)
              ],
            ),
          )
 */

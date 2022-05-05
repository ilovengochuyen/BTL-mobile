import 'package:manga/screens/register.dart';
import 'package:manga/screens/resetpass.dart';

import 'startScreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column (
                  children: <Widget>[
                    Image.asset("assets/comico.png"),

                    SizedBox(height: 40),
/*
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffff3300),

                      ),),

 */
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),
                SizedBox(height: 20),
                TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                      )

                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {},
                    color: Color(0xffff3300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: Text(
                      "LOG IN", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    ),

                  ),


                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Forget your password?",),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> resetPassword()));
                      },
                      child: Text(
                          " Reset Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xffff3300)
                          )),

                    )
                  ],
                ),
              ],
            )


        ),


      ),

    );
  }
}



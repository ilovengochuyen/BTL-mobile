import 'login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffff3300),

                      ),),
                    SizedBox(height: 20,),

                  ],
                ),
                TextField(
                    decoration: InputDecoration(
                        hintText: "Tên người dùng",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),
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
                TextField(
                    decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),
                TextField(
                    decoration: InputDecoration(
                        hintText: "Nhập lại mật khẩu",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),

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
                      "Đăng ký", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    ),

                  ),


                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Bạn đã có tài khoản?"),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> myLogin()));
                      },
                      child: Text(
                          " Đăng nhập",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xffff3300)
                          )),

                    )
                  ],
                ),

                SizedBox(height: 10,)
              ],
            )


        ),


      ),

    );
  }
}



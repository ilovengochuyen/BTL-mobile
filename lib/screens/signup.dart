import 'package:manga/widgets/password_field.dart';
import 'package:manga/widgets/round_button.dart';
import 'package:manga/widgets/text_field.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}
class SignupPageState extends State<SignupPage> {
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
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/comico.png"),
                const SizedBox(height: 40),
                Column(
                  children: <Widget> [
                    const SizedBox(height: 20,),
                    InputField(hintText: "Username", onChanged: (value) {}, icon: Icons.person),
                    InputField(hintText: "Email", onChanged: (value) {}, icon: Icons.mail),
                    PasswordField(hintText: "Password",onChanged: (value) {}),
                    PasswordField(hintText: "Confirm password",onChanged: (value) {}),
                  ],
                ),
                /*
                const SizedBox(height: 20),
                const TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),
                const SizedBox(height: 20),
                const TextField(
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
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
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
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Confirm password",
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                        )
                    )
                ),

                 */
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {},
                    color: Color(0xffff3300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: const Text(
                      "Sign Up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    ),

                  ),


                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("You have already had an account?"),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                      child: const Text(
                          " Log In",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
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



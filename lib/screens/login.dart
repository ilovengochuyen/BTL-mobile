import 'package:manga/screens/resetpass.dart';

//import 'startScreen.dart';
import 'package:flutter/material.dart';
import 'package:manga/widgets/password_field.dart';
import 'package:manga/widgets/round_button.dart';
import 'package:manga/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column (
                  children: <Widget>[
                    Image.asset("assets/comico.png"),
                    const SizedBox(height: 40), 
                    InputField(hintText: "Email", onChanged: (value) {}, icon: Icons.person),
                
                //const SizedBox(height: 20),
                PasswordField(hintText: "Password", onChanged: (value) {},),
                const SizedBox(height: 50),
                RoundedButton(text: "LOG IN", press: () {}, color: Colors.deepOrange),
                /*
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
                    color: const Color(0xffff3300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: const Text(
                      "LOG IN", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    ),

                  ),


                ),
                */
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Forget your password?",),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const resetPassword()));
                      },
                      child: const Text(
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
],

        ),


      ),
    ),
    );
  }
}



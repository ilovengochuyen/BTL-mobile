import 'comic_home_screen.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:manga/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manga/providers/UserID.dart';
import 'package:provider/provider.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}
class SignupPageState extends State<SignupPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  @override

  
  Widget build(BuildContext context) {


    final userProfile = Provider.of<UserProvider>(context);
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
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),

                //Button Signup
                const SizedBox(height: 40,),
                firebaseUIButton(context, 50, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) async {
                          User? user = FirebaseAuth.instance.currentUser;
                          userProfile.setUser(user!);
                          await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
                            'uid': user.uid,
                            'username' : _userNameTextController.text,
                            'email': _emailTextController.text,
                            'password': _passwordTextController.text,
                          });
                          print("Created New Account " + user.uid);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ComicHomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Bạn chưa nhập đủ thông tin hoặc nhập chưa chính xác, vui lòng nhập lại!"),
                          );
                        });
                  });
                }),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("You have already had an account?"),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
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



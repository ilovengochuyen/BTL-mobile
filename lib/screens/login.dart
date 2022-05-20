
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga/widgets/reusable_widget.dart';
import 'package:manga/screens/screens.dart';
import 'package:manga/providers/UserID.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _controller.repeat(reverse: true);
  }

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
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeTransition(opacity: _animation,
                    child: Image.asset("assets/comico.png"),),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                firebaseUIButton(context, 50, "Log In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                        User? user = FirebaseAuth.instance.currentUser;
                        userProfile.setUser(user!);
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ComicHomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text("Bạn chưa nhập đủ thông tin hoặc nhập chưa chính xác, vui lòng nhập lại!"),
                          );
                        });
                  });
                }),
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


        ),


      ),

    );
  }
}



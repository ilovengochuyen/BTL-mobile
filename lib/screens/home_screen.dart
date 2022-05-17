
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manga/screens/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:manga/screens/screens.dart';
/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
          child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  child: Text("Logout"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StartScreen()));
                    });
                  },
                ),
              const SizedBox(
                  height: 50,
                ),
                  GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value) => {
                        print("Sign out"),
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => UserProfile())),
                      });
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const resetPassword()));
                    },
                    child: const Text(
                        " user profile",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffff3300)
                        )),

                  ),
                const SizedBox(
                  height: 50,
                ),

              ],

            ),
        ),
 

      ),
    );
  }
}
*/
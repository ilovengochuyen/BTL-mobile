
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga/screens/screens.dart';
<<<<<<< HEAD
import 'package:manga/providers/UserID.dart';
import 'package:provider/provider.dart';

=======
/*
>>>>>>> 55ab1b1b10bb28a40af6671035b8702deef4e91d
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "a"; 
  @override
  

  Widget build(BuildContext context) {

    final userProfile = Provider.of<UserProvider>(context);
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
                    onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => UserProfile()));
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
                ),                  GestureDetector(
                    onTap: (){
                      //userProfile.setUser("12334");
                          print("UseId: ${userProfile.getUser()}")  ;

                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const resetPassword()));
                    },
                    child: const Text(
                        " userID",
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
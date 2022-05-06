
import 'package:flutter/material.dart';
import 'package:manga/widgets/text_field.dart';
//import 'package:manga/screens/startScreen.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/login.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 100,
                    ),
/*
                    child: Text(
                      'Reset Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
*/
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(

                    children: [
                      InputField(hintText: "Email", onChanged: (value) {}, icon: Icons.mail),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(290.0, 90.0),
                                minimumSize: Size(290.0, 60.0),
                                primary: Colors.deepOrange,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Text('Reset Now', style: TextStyle(fontSize: 18)),
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


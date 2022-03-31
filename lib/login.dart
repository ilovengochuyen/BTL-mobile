import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  _myLoginState createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/register.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(0, 230, 11, 11),
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 160.0,
                    ),
                    child: Text(
                      'Comico',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 40, 
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length <= 6) {
                            return 'Password must be greator than 6 digits';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          // hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(160.0, 90.0),
                                minimumSize: Size(160.0, 60.0),
                                primary: Colors.green,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                //textAlign: TextAlign.center,
                                children: [
                                  
                                  Text('Login',
                                  ),
                                ]
                              )),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgot');
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.white),
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

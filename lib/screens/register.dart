import 'package:flutter/material.dart';

class myRegister extends StatefulWidget {
  const myRegister({Key? key}) : super(key: key);

  @override
  _myRegisterState createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
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
          appBar: AppBar(
              elevation: null,
              backgroundColor: Colors.transparent,
              leading: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              )),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COMICO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 40, 
                        fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                          ElevatedButton(
                              onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(341.0, 90.0),
                                minimumSize: Size(341.0, 60.0),
                                primary: Colors.red,
                                shape: StadiumBorder(),
                              ),
                             
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgot');
                            },
                            child: Text(
                              'Register',
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

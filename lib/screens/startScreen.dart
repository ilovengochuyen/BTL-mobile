import 'package:flutter/material.dart';
import 'package:manga/widgets/round_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack (
        alignment: Alignment.center,
        children: <Widget> [
          Positioned(
            top: 10,
            left: 0,
            child: Image.asset(
              "assets/register.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget> [
              const SizedBox(height: 20),
              const Text(
                  "comico",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SacramentoRegular',
                      decoration: TextDecoration.none
                  )),

              const SizedBox(height: 100),

              RoundedButton(
                text: "LOG IN",
                color: Colors.deepOrange,
                textColor: Colors.white,
                press: () {Navigator.pushNamed(context, 'login');
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: Colors.white,
                textColor: Colors.deepOrange,
                press: () {Navigator.pushNamed(context, 'signup');
                },
              )
            ]
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class startScreen extends StatelessWidget {
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
              SizedBox(height: 20),
              Text(
                  "comico",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SacramentoRegular',
                      decoration: TextDecoration.none
                  )),

              SizedBox(height: 100),

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

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    Key ? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
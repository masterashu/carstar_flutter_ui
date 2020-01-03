import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 144, left: 36, right: 36),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width - 72,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Need a car?\nRent it quickly now!",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Gilroy"),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "You can choose your ideal car and book it easily with Carstar.",
                        style: TextStyle(fontSize: 20, fontFamily: "Gilroy"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(newRoute)
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                  color: Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Letʼs go",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

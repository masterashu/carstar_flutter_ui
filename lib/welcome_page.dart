import 'package:carstar/car_listing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    if (screenWidth > 300) {
      return _buildWeb(context);
    }
    return _buildMobile(context);
  }

  Widget _buildWeb(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 1000),
          Expanded(
            flex: 1618,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Need a car?\nRent it quickly now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.w800, fontFamily: "Gilroy"),
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
          Expanded(
            flex: 1000,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarsList()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Theme.of(context).accentColor,
                  ),
                  padding: EdgeInsets.all(32.0),
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
          ),
          Spacer(flex: 1000),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
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
                            fontSize: 36, fontWeight: FontWeight.w800, fontFamily: "Gilroy"),
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarsList()));
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

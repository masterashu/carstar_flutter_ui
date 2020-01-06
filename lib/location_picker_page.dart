import 'package:flutter/material.dart';

class LocationPickerPage extends StatefulWidget {
  LocationPickerPage({Key key}) : super(key: key);

  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 240, 240, 240),
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/map.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 80,
            left: 50,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 8),
              width: MediaQuery.of(context).size.width - 100,
              height: 64,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(80)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 20, fontFamily: "Gilroy"),
                      decoration: InputDecoration(
                        hintText: "Search location",
                        hintStyle:
                            TextStyle(fontSize: 20, fontFamily: "Gilroy"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          CustomPaint(
            painter: GpsPin(Offset(MediaQuery.of(context).size.width / 2,
                MediaQuery.of(context).size.height / 2)),
            child: Container(
              width: 40,
              height: 70,
            ),
          ),
          Positioned(
            bottom: 100,
            right: 40,
            child: FloatingActionButton(
              // mini: true,
              onPressed: () {},
              splashColor: Color.fromARGB(255, 208, 241, 215),
              child: Icon(
                Icons.gps_not_fixed,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.shortestSide / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.all(12.0),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GpsPin extends CustomPainter {
  final Offset center;
  GpsPin(this.center);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color.fromARGB(255, 150, 60, 214);
    canvas.drawCircle(center + Offset(0, -50), 20, paint);
    Paint paint2 = Paint()
      ..color = Color.fromARGB(255, 150, 60, 214)
      ..strokeWidth = 3;
    canvas.drawLine(center, center + Offset(0, -30), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

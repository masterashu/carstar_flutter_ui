import 'package:carstar/cars.dart';
import 'package:carstar/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class CarDetailPage extends StatefulWidget {
  CarDetailPage(this.car, {Key key}) : super(key: key);
  final Car car;
  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomPaint(
        painter: ShapesPainter(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 40, bottom: 32),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: "car_name_${widget.car.fullname}",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.car.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Hero(
                      tag: "car_manufacturer_${widget.car.fullname}",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.car.manufacturer,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Center(
                child: Hero(
                  tag: "car_image_${widget.car.fullname}",
                  child: Image.asset(
                    widget.car.image,
                    width: MediaQuery.of(context).size.width - 40,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 40, bottom: 24),
                        child: Text(
                          "Specifications",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      ..._buildSpecifications(),
                      Padding(
                        padding: EdgeInsets.only(top: 24, left: 40, bottom: 4),
                        child: Text(
                          "Expert rating",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4, left: 40, bottom: 20),
                        child: Text(
                          "Rating breakdown on a scale of 1 to 5",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      ),
                      ...buildRatings(),
                    ],
                  ),
                ),
              ),
              Hero(
                tag: "rate_book_${widget.car.fullname}",
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "\$ ${widget.car.rate.toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w800)),
                          TextSpan(
                              text: "  /day",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Gilroy",
                              ))
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print("book");
                        },
                        child: Container(
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
                              "Book",
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSpecifications() {
    List<Widget> specRows = [];
    specRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FeatureIcons(
            CarSpecification.images[0], widget.car.specification.maxSpeed),
        FeatureIcons(
            CarSpecification.images[1], widget.car.specification.gearSystem),
        FeatureIcons(
            CarSpecification.images[2], widget.car.specification.engine),
      ],
    ));
    specRows.add(Padding(padding: EdgeInsets.only(top: 24)));
    specRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FeatureIcons(CarSpecification.images[3], widget.car.specification.fuel),
        FeatureIcons(
            CarSpecification.images[4], widget.car.specification.seats),
        FeatureIcons(CarSpecification.images[5], widget.car.specification.type),
      ],
    ));
    return specRows;
  }

  buildRatings() {
    List<Widget> ratings = [];
    ratings.add(Padding(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "Consomption",
              style: TextStyle(fontSize: 18, fontFamily: "Gilroy"),
            ),
          ),
          Expanded(
              flex: 3,
              child: RatingWidget(
                widget.car.consomption.index + 1,
                5,
                fill: Theme.of(context).accentColor,
              )),
        ],
      ),
    ));
    ratings.add(Padding(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "Comfort",
              style: TextStyle(fontSize: 18, fontFamily: "Gilroy"),
            ),
          ),
          Expanded(
              flex: 3,
              child: RatingWidget(
                widget.car.comfort.index + 1,
                5,
                fill: Theme.of(context).accentColor,
              )),
        ],
      ),
    ));
    ratings.add(Padding(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "Safety",
              style: TextStyle(fontSize: 18, fontFamily: "Gilroy"),
            ),
          ),
          Expanded(
              flex: 3,
              child: RatingWidget(
                widget.car.safety.index + 1,
                5,
                fill: Theme.of(context).accentColor,
              )),
        ],
      ),
    ));
    return ratings;
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: Add Linear Gradient to Upper Rectangle too.
    final grey = Paint();
    grey.color = Color.fromARGB(255, 240, 240, 240);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.width * 3 / 4), grey);
    //
    final paint = Paint();
    paint.color = Color.fromARGB(255, 208, 241, 215);
    var center = Offset(size.width * 7 / 8, size.width * 7 / 20);
    var radius = size.width * 2 / 5;
    canvas.drawCircle(center, radius, paint);
    //
    final bg = Paint();
    bg.shader = LinearGradient(colors: [
      Color.fromARGB(255, 249, 249, 249),
      Colors.white
    ]).createShader(Rect.fromLTWH(
        0, size.width * 3 / 4, size.width, size.height - (size.width * 3 / 4)));
    canvas.drawRect(
        Rect.fromLTWH(0, size.width * 3 / 4, size.width,
            size.height - (size.width * 3 / 4)),
        bg);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FeatureIcons extends StatelessWidget {
  const FeatureIcons(this.image, this.text, {Key key}) : super(key: key);
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 240, 240, 240),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 32,
              height: 32,
            ),
            Divider(
              color: Colors.black,
              indent: 8,
              endIndent: 8,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

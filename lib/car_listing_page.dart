import 'package:carstar/cars.dart';
import 'package:flutter/material.dart';

class CarsList extends StatefulWidget {
  CarsList({Key key}) : super(key: key);

  @override
  _CarsListState createState() => _CarsListState();
}

class _CarsListState extends State<CarsList> {
  List<bool> filterChoices = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 244, 244, 244),
            Color.fromARGB(255, 228, 228, 228),
          ], end: AlignmentDirectional.topStart),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "What is your ",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Gilroy",
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "choice?",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getFilterToggles(),
                  InkWell(
                    child: ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 235, 235, 235),
                        child: Icon(
                          Icons.filter_list,
                          size: 32,
                        ),
                      ),
                    ),
                    splashColor: Theme.of(context).accentColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _getCarCards(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCarCards() {
    List<Widget> carDataList = [];
    for (Car x in carData) {
      carDataList.add(CarDetailsCard(x));
      carDataList.add(Container(height: 24));
    }
    return carDataList;
  }

  _getFilterToggles() {
    List<Widget> toggles = [];
    List<String> filterTypes = ["Sedan", "Convertibles", "Automatic"];
    for (int i = 0; i < filterTypes.length; i++) {
      toggles.add(
        InkWell(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: filterChoices[i]
                  ? Theme.of(context).accentColor
                  : Color.fromARGB(255, 235, 235, 235),
            ),
            child: Text(
              filterTypes[i],
              style: TextStyle(
                fontSize: 14,
                color: filterChoices[i]
                    ? Colors.white
                    : Color.fromARGB(255, 50, 50, 50),
              ),
            ),
          ),
          splashColor:
              Color.alphaBlend(Colors.white24, Theme.of(context).accentColor),
          onTap: () {
            setState(() {
              filterChoices[i] = !filterChoices[i];
            });
          },
        ),
      );
      if (i < filterTypes.length - 1) {
        toggles.add(Container(width: 12));
      }
    }
    return Row(children: toggles);
  }
}

class CarDetailsCard extends StatefulWidget {
  final Car car;
  CarDetailsCard(this.car, {Key key}) : super(key: key);

  @override
  _CarDetailsCardState createState() => _CarDetailsCardState();
}

class _CarDetailsCardState extends State<CarDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 3,
            color: Color.fromARGB(255, 228, 228, 228),
          ),
        ],
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Container(
        width: 420,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 12, left: 24),
                  child: Text(
                    widget.car.name,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Gilroy"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12, right: 24),
                  child: Text(
                    widget.car.manufacturer,
                    style: TextStyle(fontSize: 24, fontFamily: "Gilroy"),
                  ),
                )
              ],
            ),
            Image.asset(
              widget.car.image,
              height: 180,
            ),
            Row(
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
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32)),
                        color: Theme.of(context).accentColor,
                      ),
                      padding: EdgeInsets.all(12.0),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<Car> carData = [
  Car("Sonata", "Hyundai", 80.06, "assets/images/sonata.png",
      CarSpecification("210 Km/h", "Auto", "4 Cyl", "Gas", "5 Seats", "Sedan"),
      consomption: Rating.worse, comfort: Rating.good, safety: Rating.great),
  Car("i8", "BMW", 130.08, "assets/images/sonata.png",
      CarSpecification("210 Km/h", "Auto", "4 Cyl", "Gas", "5 Seats", "Sedan"),
      consomption: Rating.worse, comfort: Rating.good, safety: Rating.great),
  Car("i8", "BMW", 130.08, "assets/images/sonata.png",
      CarSpecification("210 Km/h", "Auto", "4 Cyl", "Gas", "5 Seats", "Sedan"),
      consomption: Rating.worse, comfort: Rating.good, safety: Rating.great),
];

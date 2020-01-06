import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double height;
  final Color fill, disabledFill;
  final int blockFlex;
  RatingWidget(this.rating, this.maxRating,
      {this.height = 10.0,
      this.blockFlex = 25,
      this.disabledFill = const Color.fromARGB(255, 240, 240, 240),
      @required this.fill,
      key})
      : super(key: key) {
    if (maxRating < 2) {
      throw Exception("maxRating should be greater than 2");
    }
    if (rating > maxRating) {
      throw Exception("rating cannot be greater than maxRating");
    }
    if (rating < 1) {
      throw Exception("rating cannot be less than 1");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ratings = [];
    ratings.add(Expanded(
      flex: 1,
      child: Container(),
    ));
    for (int i = 1; i <= maxRating; i++) {
      if (i == 1) {
        ratings.add(
          Expanded(
            flex: blockFlex,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: (i <= rating) ? fill : disabledFill,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(height),
                  bottomLeft: Radius.circular(height),
                ),
              ),
            ),
          ),
        );
        ratings.add(Expanded(
          flex: 1,
          child: Container(),
        ));
      } else if (i == maxRating) {
        ratings.add(
          Expanded(
            flex: blockFlex,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: (i <= rating) ? fill : disabledFill,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(height),
                  bottomRight: Radius.circular(height),
                ),
              ),
            ),
          ),
        );
        ratings.add(Expanded(
          flex: 1,
          child: Container(),
        ));
      } else {
        ratings.add(
          Expanded(
            flex: blockFlex,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: (i <= rating) ? fill : disabledFill,
              ),
            ),
          ),
        );
        ratings.add(Expanded(
          flex: 1,
          child: Container(),
        ));
      }
    }
    return Container(
        child: Row(
      children: ratings,
    ));
  }
}

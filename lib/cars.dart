class Car {
  String manufacturer, name, image;
  double rate;
  CarSpecification specification;
  String get fullname {
    return "$manufacturer $name";
  }

  Rating consomption, comfort, safety;
  Map<String, int> get ratings {
    Map<String, int> rating;
    rating["Consomption"] = consomption.index + 1;
    rating["Comfort"] = comfort.index + 1;
    rating["Safety"] = safety.index + 1;
    return rating;
  }

  Car(this.name, this.manufacturer, this.rate, this.image, this.specification,
      {this.consomption, this.comfort, this.safety});
}

class CarSpecification {
  String maxSpeed, gearSystem, engine, fuel, seats, type;

  CarSpecification(this.maxSpeed, this.gearSystem, this.engine, this.fuel,
      this.seats, this.type);
}

enum Rating { worse, bad, fine, good, great }

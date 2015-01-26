library car;

class Car {

  int _price;
  String type;
  String brand;

  Car(this.type, this.brand, this._price);

  int get price => _price;

}

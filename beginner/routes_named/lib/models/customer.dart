import 'order.dart';

class Customer {
  String _name;
  String _location;
  List<Order> _orders;

  Customer(this._name, this._location, this._orders);
  
  List<Order> get orders => _orders;
  String get location => _location;
  String get name => _name;
}

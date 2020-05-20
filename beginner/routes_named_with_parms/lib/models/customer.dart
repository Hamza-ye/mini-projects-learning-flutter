import 'order.dart';

class Customer {
  int _id;
  String _name;
  String _location;
  List<Order> _orders;

  Customer(this._id, this._name, this._location, this._orders);

  Customer.empty() : this(0, "", "", []);

  int get id => _id;
  List<Order> get orders => _orders;
  String get location => _location;
  String get name => _name;
  
}

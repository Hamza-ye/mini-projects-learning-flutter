class Order {
  int _id;
  DateTime _dt;
  String _description;
  double _total;

  Order(this._id, this._dt, this._description, this._total);

  Order.empty() : this(0, DateTime.now(), "", 0.0);

  int get id => _id;
  double get total => _total;
  String get description => _description;
  DateTime get dt => _dt;
  
}

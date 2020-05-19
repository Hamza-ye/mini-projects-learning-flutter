import 'package:flutter/material.dart';
import 'package:routes_simple/models/customer.dart';
import 'package:routes_simple/models/order.dart';

class OrderWidget extends StatelessWidget {
  Customer _customer;
  Order _order;

  OrderWidget(this._customer, this._order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Info"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              _customer.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(_customer.location,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(""),
            Text(_order.description,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(
                "${_order.dt.month}/${_order.dt.day}/${_order.dt.year}: "
                "\$${_order.total}",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

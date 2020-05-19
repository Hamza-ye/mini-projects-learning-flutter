import 'package:flutter/material.dart';
import 'package:routes_simple/models/customer.dart';
import 'package:routes_simple/models/order.dart';

import 'order_widget.dart';

class CustomerWidget extends StatelessWidget {
  final Customer _customer;
  CustomerWidget(this._customer);

  void navigateToOrder(BuildContext context, Customer customer, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderWidget(customer, order),
      ),
    );
  }

  ListTile createOrderListWidget(
      BuildContext context, Customer customer, Order order) {
    return new ListTile(
        title: Text(order.description),
        subtitle: Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: "
            "\$${order.total}"),
        trailing: Icon(Icons.arrow_right),
        onTap: () => navigateToOrder(context, customer, order));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List.from(_customer.orders.map(
        (Order order) => createOrderListWidget(context, _customer, order)));
    widgetList.insert(
        0,
        Container(
          child: Column(
            children: <Widget>[
              Text(_customer.name,
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              Text(_customer.location,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text("${_customer.orders.length} Orders",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ],
          ),
          padding: EdgeInsets.all(20.0),
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Info"),
      ),
      body: Center(
        child: ListView(
          children: widgetList,
        ),
      ),
    );
  }
}

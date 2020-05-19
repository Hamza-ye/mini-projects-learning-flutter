import 'package:flutter/material.dart';
import 'package:routes_named/models/order.dart';

class CustomerWidget extends StatelessWidget {
  // final Customer _customer;

  List<Order> _orderList = [
    Order(DateTime(2018, 11, 17), "Bicycle parts", 197.00),
    Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45),
  ];

  CustomerWidget();

  void navigateToOrder(BuildContext context, Order order) {
    Navigator.pushNamed(context, "/order"); // only simple routes work
  }

  ListTile createOrderWidget(BuildContext context, Order order) {
    return ListTile(
        title: Text(order.description),
        subtitle: Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: "
            "\$${order.total}"),
        trailing: Icon(Icons.arrow_right),
        onTap: () => navigateToOrder(context, order));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List.from(
        _orderList.map((Order order) => createOrderWidget(context, order)));
    widgetList.insert(
        0,
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "BikeCorp",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Atlanta",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "2 Orders",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
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

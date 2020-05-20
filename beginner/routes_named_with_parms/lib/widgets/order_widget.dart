import 'package:flutter/material.dart';
import 'package:routes_named_with_parms/models/customer.dart';
import 'package:routes_named_with_parms/models/order.dart';

import 'data_container_widget.dart';

class OrderWidget extends StatelessWidget {
  int _id;

  OrderWidget(this._id);

  @override
  Widget build(BuildContext context) {

    DataContainerWidget data =
        context.inheritFromWidgetOfExactType(DataContainerWidget);

    Customer customer = data.getCustomerForOrderId(_id);

    Order order = data.getOrder(_id);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Order Info"),
        ),
        body: new Padding(
          padding: EdgeInsets.all(20.0),
          child: new ListView(
            children: <Widget>[
              Text(customer.name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              Text(customer.location,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(""),
              Text(order.description,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(
                  "${order.dt.month}/${order.dt.day}/${order.dt.year} \$${order.total}",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}

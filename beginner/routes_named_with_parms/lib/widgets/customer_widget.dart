import 'package:flutter/material.dart';
import 'package:routes_named_with_parms/models/customer.dart';
import 'package:routes_named_with_parms/models/order.dart';

import 'data_container_widget.dart';

class CustomerWidget extends StatelessWidget {
  int _id;

  CustomerWidget(this._id);
  void navigateToOrder(BuildContext context, Order order) {
    Navigator.pushNamed(context, '/order/:${order.id}');
  }

  ListTile createOrderListWidget(BuildContext context, Order order) {
    return new ListTile(
        title: Text(order.description),
        subtitle: Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: "
            "\$${order.total}"),
        trailing: Icon(Icons.arrow_right),
        onTap: () => navigateToOrder(context, order));
  }

  @override
  Widget build(BuildContext context) {

    DataContainerWidget data = DataContainerWidget.of(context);

    Customer customer = data.getCustomer(_id);
    
    List<Widget> orderListWidgets = List.from(customer.orders
        .map((Order order) => createOrderListWidget(context, order)));
    orderListWidgets.insert(
        0,
        Container(
            child: Column(
              children: <Widget>[
                Text(
                  customer.name,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  customer.location,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${customer.orders.length} Orders",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            padding: EdgeInsets.all(20.0)));
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Customer Info"),
        ),
        body: new Center(
          child: new ListView(
            children: orderListWidgets,
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:routes_simple/models/customer.dart';
import 'package:routes_simple/models/order.dart';

import 'widgets/customer_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Routes simple Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Customer> _customerList = [
    Customer("Bike Corp", "Atlanta", [
      Order(DateTime(2018, 11, 17), "Bicycle parts", 197.02),
      Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45),
    ]),
    Customer("Trust Corp", "Atlanta", [
      Order(DateTime(2017, 1, 3), "Shredder parts", 97.02),
      Order(DateTime(2018, 3, 13), "Shredder blade", 7.45),
      Order(DateTime(2018, 5, 2), "Shredder blade", 7.45),
    ]),
    Customer("Jilly Boutique", "Birmingham", [
      Order(DateTime(2018, 1, 3), "Display unit", 97.01),
      Order(DateTime(2018, 3, 3), "Desk unit", 12.25),
      Order(DateTime(2018, 3, 21), "Clothes rack", 97.15),
    ]),
  ];

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  void navigateToCustomer(BuildContext context, Customer customer){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomerWidget(customer),
      ),
    );
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.location),
      trailing: Icon(Icons.arrow_right),
      onTap: () => navigateToCustomer(context, customer),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> customerList = List.from(
      _customerList.map((Customer customer) => createCustomerWidget(context, customer))
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: customerList,
        ),
      ),
    );
  }
}

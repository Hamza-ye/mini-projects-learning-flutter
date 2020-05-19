import 'package:flutter/material.dart';
import 'models/customer.dart';
import 'widgets/customer_widget.dart';
import 'widgets/order_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/customer': (context) => CustomerWidget(), // only simple routes work
        '/order': (context) => OrderWidget(), // only simple routes work
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Customer> _customerList = [
    Customer("Bike Corp", "Atlanta", []),
    Customer("Trust Corp", "Atlanta", []),
    Customer("Jilly Boutique", "Birmingham", []),
  ];

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  void navigateToCustomer(BuildContext context, Customer customer) {
    Navigator.pushNamed(context, "/customer"); // only simple routes work
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return new ListTile(
        title: Text(customer.name),
        subtitle: Text(customer.location),
        trailing: Icon(Icons.arrow_right),
        onTap: () => navigateToCustomer(context, customer));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> customerList = List.from(_customerList
        .map((Customer customer) => createCustomerWidget(context, customer)));
        
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

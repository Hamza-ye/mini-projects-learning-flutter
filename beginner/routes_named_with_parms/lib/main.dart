import 'package:flutter/material.dart';
import 'package:routes_named_with_parms/widgets/data_container_widget.dart';

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
      home: DataContainerWidget(
          child: MyHomePage(title: 'Route named with params Home Page')),
      onGenerateRoute: handleRoute,
    );
  }

  Route<dynamic> handleRoute(RouteSettings routeSettings) {
    // One route handler to handle them all.
    List<String> nameParm = routeSettings.name.split(":");
    assert(nameParm.length == 2);
    String name = nameParm[0];
    assert(name != null);
    int id = int.tryParse(nameParm[1]);
    assert(id != null);
    Widget childWidget;
    if (name == "/customer/") {
      childWidget = CustomerWidget(id);
    } else {
      childWidget = OrderWidget(id);
    }
    return MaterialPageRoute(
        builder: (context) => DataContainerWidget(child: childWidget));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  void navigateToCustomer(BuildContext context, Customer customer) {
    Navigator.pushNamed(context, '/customer/:${customer.id}');
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return new ListTile(
        title: Text(customer.name),
        subtitle: Text(customer.location),
        trailing: Icon(Icons.arrow_right),
        onTap: () => navigateToCustomer(context, customer));
  }

  final String title;
  @override
  Widget build(BuildContext context) {
    DataContainerWidget data = DataContainerWidget.of(context);
    List<Widget> customerList = List.from(data.customerList
        .map((Customer customer) => createCustomerWidget(context, customer)));

    return Scaffold(
      appBar: AppBar(
        title: Text("Customers"),
      ),
      body: Center(
        child: ListView(
          children: customerList,
        ),
      ),
    );
  }
}

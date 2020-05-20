import 'package:flutter/material.dart';
import 'package:routes_named_with_parms/models/customer.dart';
import 'package:routes_named_with_parms/models/order.dart';

class DataContainerWidget extends InheritedWidget {

  DataContainerWidget({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  List<Customer> _customerList = [
    Customer(1, "Bike Corp", "Atlanta", [
      Order(11, DateTime(2018, 11, 17), "Bicycle parts", 197.02),
      Order(12, DateTime(2018, 12, 1), "Bicycle parts", 107.45),
    ]),
    Customer(2, "Trust Corp", "Atlanta", [
      Order(13, DateTime(2017, 1, 3), "Shredder parts", 97.02),
      Order(14, DateTime(2018, 3, 13), "Shredder blade", 7.45),
      Order(15, DateTime(2018, 5, 2), "Shredder blade", 7.45),
    ]),
    Customer(3, "Jilly Boutique", "Birmingham", [
      Order(16, DateTime(2018, 1, 3), "Display unit", 97.01),
      Order(17, DateTime(2018, 3, 3), "Desk unit", 12.25),
      Order(18, DateTime(2018, 3, 21), "Clothes rack", 97.15),
    ]),
  ];
  
  List<Customer> get customerList => _customerList;

  Customer getCustomer(int id) {
    return _customerList.firstWhere((customer) => customer.id == id,
        orElse: () => Customer.empty());
  }

  Customer getCustomerForOrderId(int id) {
    return customerList.firstWhere(
        (customer) => customerHasOrderId(customer, id),
        orElse: () => Customer.empty());
  }

  Order getOrder(int id) {
    Customer customerThatOwnsOrder = getCustomerForOrderId(id);
    return customerThatOwnsOrder.orders
        .firstWhere((order) => order.id == id, orElse: () => Order.empty());
  }

  bool customerHasOrderId(Customer customer, int id) {
    Order order = customer.orders
        .firstWhere((order) => order.id == id, orElse: () => Order.empty());
    return order.id != 0;
  }

  static DataContainerWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DataContainerWidget)
        as DataContainerWidget;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
  
}

import 'package:flutter/material.dart';
import 'package:http_employees/models/employee.dart';
import 'package:http_employees/widgets/api_widget.dart';
import 'package:http_employees/widgets/employee_detail_widget.dart';

import 'please_wait_widget.dart';

class EmployeeListWidget extends StatefulWidget {
  @override
  _EmployeeListWidgetState createState() => new _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PleaseWaitWidget _pleaseWaitWidget =
      PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));
  bool _refresh = true;
  List<Employee> _employees;
  bool _pleaseWait = false;
  _showSnackBar(String content, {bool error = false}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content:
          Text('${error ? "An unexpected error occurred: " : ""}${content}'),
    ));
  }

  _showPleaseWait(bool b) {
    setState(() {
      _pleaseWait = b;
    });
  }

  _navigateToEmployee(BuildContext context, String employeeId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeDetailWidget(employeeId)),
    ).then((result) {
      if ((result != null) && (result is bool) && (result == true)) {
        _showSnackBar('Employee saved.');
        _refreshEmployees();
      }
    });
  }

  _deleteEmployee(BuildContext context, Employee employee) async {
    _showDeleteConfirmDialog(employee).then((result) {
      if ((result != null) && (result is bool) && (result == true)) {
        _showPleaseWait(true);
        try {
          ApiWidget.of(context).deleteEmployee(employee.id).then((employee) {
            _showPleaseWait(false);
            _showSnackBar('Employee deleted.');
            _refreshEmployees();
          }).catchError((error) {
            _showPleaseWait(false);
            _showSnackBar(error.toString(), error: true);
          });
        } catch (e) {
          _showPleaseWait(false);
          _showSnackBar(e.toString(), error: true);
        }
      }
    });
  }

  Future<bool> _showDeleteConfirmDialog(Employee employee) async {
    return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Employee'),
            content: Text(
                'Are you sure you want to delete ${employee.employeeName}?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  _refreshEmployees() {
    setState(() {
      _refresh = true;
    });
  }

  _loadEmployees(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context).loadAndParseEmployees().then((employees) {
        employees.sort((a, b) => a.employeeName
            .toLowerCase()
            .compareTo(b.employeeName.toLowerCase()));
        setState(() {
          _employees = employees;
        });
        _showPleaseWait(false);
      }).catchError((error) {
        _showPleaseWait(false);
        _showSnackBar(error.toString(), error: true);
      });
    } catch (e) {
      _showPleaseWait(false);
      _showSnackBar(e.toString(), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_refresh) {
      _refresh = false;
      _loadEmployees(context);
    }
    print(_employees);
    ListView builder = ListView.builder(
        itemCount: _employees != null ? _employees.length : 0,
        itemBuilder: (context, index) {
          Employee employee = _employees[index];
          return ListTile(
              title: Text('${employee.employeeName}'),
              subtitle: Text('Age: ${employee.employeeAge}'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => _navigateToEmployee(context, employee.id),
              onLongPress: () => _deleteEmployee(context, employee));
        });
    Widget bodyWidget = _pleaseWait
        ? Stack(key: ObjectKey("stack"), children: [_pleaseWaitWidget, builder])
        : Stack(key: ObjectKey("stack"), children: [builder]);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Employees"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () {
                  _navigateToEmployee(context, null);
                }),
            IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  _refreshEmployees();
                })
          ],
        ),
        body: Center(
          child: bodyWidget,
        ));
  }
}

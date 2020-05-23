import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_employees/models/employee.dart';

import 'api_widget.dart';
import 'please_wait_widget.dart';

class EmployeeDetailWidget extends StatefulWidget {
  String _employeeId;
  EmployeeDetailWidget(this._employeeId);
  @override
  _EmployeeDetailState createState() => _EmployeeDetailState(this._employeeId);
}

class _EmployeeDetailState extends State<EmployeeDetailWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final PleaseWaitWidget _pleaseWaitWidget =
      PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));
  String _employeeId;
  bool _loaded = false;
  bool _pleaseWait = false;
  Employee _employee;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _salaryTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _profileImageTextController = TextEditingController();
  _EmployeeDetailState(this._employeeId);
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

  TextFormField _createNameWidget() {
    return new TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter the name.';
        }
      },
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: 'Name',
          labelText: 'Enter the name'),
      onSaved: (String value) {
        this._employee.employeeName = value;
      },
      controller: _nameTextController,
      autofocus: true,
    );
  }

  TextFormField _createSalaryWidget() {
    return new TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter the salary.';
        }
        int salary = int.parse(value);
        if (salary == null) {
          return 'Please enter the salary as a number.';
        }
        if ((salary < 10000) || (salary > 500000)) {
          return 'Please enter an age between 10000 and 50000.';
        }
      },
      maxLength: 6,
      maxLengthEnforced: true,
      keyboardType: TextInputType.phone,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: 'Salary',
          labelText: 'Enter the salary'),
      onSaved: (String value) {
        this._employee.employeeSalary = value;
      },
      controller: _salaryTextController,
    );
  }

  TextFormField _createAgeWidget() {
    return new TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter the age.';
        }
        int age = int.parse(value);
        if (age == null) {
          return 'Please enter the age as a number.';
        }
        if ((age < 1) || (age > 114)) {
          return 'Please enter an age between 1 and 114.';
        }
      },
      maxLength: 3,
      maxLengthEnforced: true,
      keyboardType: TextInputType.phone,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: 'Age',
          labelText: 'Enter the age'),
      onSaved: (String value) {
        this._employee.employeeAge = value;
      },
      controller: _ageTextController,
    );
  }

  TextFormField _createProfileImageWidget() {
    return new TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: 'Profile image',
          labelText: 'Enter the profile image'),
      onSaved: (String value) {
        this._employee.profileImage = value;
      },
      controller: _profileImageTextController,
    );
  }

  _loadEmployee(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context).loadEmployee(_employeeId).then((employee) {
        setState(() {
          _employee = employee;
          _nameTextController.text = employee.employeeName;
          _salaryTextController.text = employee.employeeSalary;
          _ageTextController.text = employee.employeeAge;
          _profileImageTextController.text = employee.profileImage;
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

  _saveEmployee(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context).saveEmployee(_employee).then((employee) {
        _showPleaseWait(false);
        Navigator.pop(context, true);
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
    if (!_loaded) {
      _loaded = true;
      if (_employeeId == null) {
        _employee = Employee.empty();
      } else {
        _loadEmployee(context);
      }
    }
    List<Widget> formWidgetList = [
      _createNameWidget(),
      _createSalaryWidget(),
      _createAgeWidget(),
      _createProfileImageWidget(),
      RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _saveEmployee(context);
          }
        },
        child: new Text('Save'),
      )
    ];
    Form form = Form(key: _formKey, child: ListView(children: formWidgetList));
    Widget bodyWidget = _pleaseWait
        ? Stack(key: ObjectKey("stack"), children: [_pleaseWaitWidget, form])
        : Stack(key: ObjectKey("stack"), children: [form]);
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Row(children: [
            Text("Back"),
            Spacer(),
            Text(_employeeId == null ? "Create Employee" : "Edit Employee")
          ]),
        ),
        body: new Padding(padding: EdgeInsets.all(20.0), child: bodyWidget));
  }
}

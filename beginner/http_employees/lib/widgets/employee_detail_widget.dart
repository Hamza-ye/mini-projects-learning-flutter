import 'package:flutter/material.dart';

class EmployeeDetailWidget extends StatefulWidget {
  final String _employeeId;

  const EmployeeDetailWidget(this._employeeId);

  @override
  _EmployeeDetailWidgetState createState() => _EmployeeDetailWidgetState(_employeeId);
}

class _EmployeeDetailWidgetState extends State<EmployeeDetailWidget> {
  final String _employeeId;
  _EmployeeDetailWidgetState(this._employeeId);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
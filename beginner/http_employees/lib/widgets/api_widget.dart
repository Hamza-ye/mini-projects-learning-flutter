import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as HTTP;
import 'package:http/http.dart';
import 'package:http_employees/models/employee.dart';

class ApiWidget extends InheritedWidget {
  static final String _BASE_URL = "http://dummy.restapiexample.com/api/v1";
  static const _TIMEOUT = Duration(seconds: 10);
  ApiWidget({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);
  static ApiWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ApiWidget) as ApiWidget;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  Future<List<Employee>> loadAndParseEmployees() async {
    var url = '${_BASE_URL}/employees';
    final response = await HTTP.get(url).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      List<dynamic> data = parsed['data'];
      var list =
          data.map<Employee>((json) => Employee.fromJson(json)).toList();
      return list;
    } else {
      badStatusCode(response);
    }
  }

  Future<Employee> loadEmployee(String id) async {
    var url = '${_BASE_URL}/employee/${id}';
    final response = await HTTP.get(url).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return Employee.fromJson(parsed);
    } else {
      badStatusCode(response);
    }
  }

  Future<dynamic> saveEmployee(Employee employee) async {
    bool isUpdate = employee.id.isNotEmpty;
    final uri = _BASE_URL + (isUpdate ? '/update/${employee.id}' : '/create');
// profile image does not seem to update
    final response = isUpdate
        ? await HTTP.put(uri, body: json.encode(employee)).timeout(_TIMEOUT)
        : await HTTP.post(uri, body: json.encode(employee)).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
// If that response was not OK, throw an error.
      badStatusCode(response);
    }
  }

  Future<dynamic> deleteEmployee(String id) async {
    final uri = '${_BASE_URL}/delete/${id}';
    final response = await HTTP.delete(uri).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
// If that response was not OK, throw an error.
      badStatusCode(response);
    }
  }

  badStatusCode(Response response) {
    debugPrint("Bad status code ${response.statusCode} returned from server.");
    debugPrint("Response body ${response.body} returned from server.");
    throw Exception(
        'Bad status code ${response.statusCode} returned from server.');
  }
}

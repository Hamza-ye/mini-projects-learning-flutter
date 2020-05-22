import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/person.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _jsonTextController = TextEditingController();
  Person _person;
  String _error;

  HomeWidgetState() {
    final String person =
        "{\"name\":\"Tracy Brown\", \"addr1\":\"9625 Roberts Avenue\"," +
            "\"city\":\"Birmingham\", \"state\":\"AL\"}";
    _jsonTextController.text = person;
  }

  TextFormField _createJsonTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter the json';
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Json',
        labelText: 'Enter the json for a person.',
      ),
      controller: _jsonTextController,
      autofocus: true,
      maxLines: 8,
      keyboardType: TextInputType.multiline,
    );
  }

  _convertJsonToPerson() {
    _error = null;
    _person = null;
    setState(() {
      try {
        final String jsonText = _jsonTextController.text;
        debugPrint("JSON TEXT: ${jsonText}");
        var decoded = json.decode(jsonText); // text to map
        debugPrint("DECODED:  type: ${decoded.runtimeType} value: ${decoded}");
        _person = Person.fromJson(decoded); // map to object
        debugPrint("PERSON OBJECT: type: ${_person.runtimeType} value: "
            "${_person}");
      } catch (e) {
        debugPrint("ERROR: ${e}");
        _error = e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          child: ListView(
            children: <Widget>[
              _createJsonTextFormField(),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                      _error == null ? '' : 'An error occurred:\n\n${_error}',
                      style: TextStyle(color: Colors.red))),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(_person == null
                      ? 'Person is null'
                      : 'Converted to Person object:\n\n${_person}'))
            ],
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convertJsonToPerson,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

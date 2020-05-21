import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      home: MyHomePage(title: 'Serialization'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const Person _person =
      Person("John Brown", "9621 Roberts Avenue", "Birmingham", "AL");

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serialization'),
      ),
      body: Center(
        child: Padding(
          child: ListView(
            children: <Widget>[
              Padding(
                child: Text("Grandfather:\n${_person}"),
                padding: EdgeInsets.only(top: 0.0),
              ),
              Padding(
                  child: Text("Json Encoded:\n${json.encode(_person)}",
                      style: TextStyle(color: Colors.red)),
                  padding: EdgeInsets.only(top: 10.0)),
              FlatButton(
                child: Text("Copy"),
                onPressed: (() => {
                  Clipboard.setData(ClipboardData(text: "${json.encode(_person)}"))
                })),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'models/person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  static const Person _grandchild =
      Person("Tracy Brown", "9625 Roberts Avenue", "Birmingham", "AL", []);

  static const Person _adultFather = const Person(
      "John Brown", "9625 Roberts Avenue", "Birmingham", "AL", [_grandchild]);

  static const Person _adultNoChildren =
      const Person("Jill Jones", "100 East Road", "Ocala", "FL", []);

  static const Person _grandfather = Person("John Brown", "9621 Roberts Avenue",
      "Birmingham", "AL", [_adultFather, _adultNoChildren]);

  final String title;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recursive Serialization"),
        ),
        body: Center(
          child: Padding(
            child: ListView(
              children: <Widget>[
                Padding(
                    child: Text("Grandfather:\n${_grandfather}"),
                    padding: EdgeInsets.only(top: 0.0)),
                Padding(
                    child: Text("Json Encoded:\n${json.encode(_grandfather)}",
                        style: TextStyle(color: Colors.red)),
                    padding: EdgeInsets.only(top: 10.0)),
                FlatButton(
                    child: Text("Copy"),
                    onPressed: (() {
                      Clipboard.setData(
                          ClipboardData(text: "${json.encode(_grandfather)}"));
                    })),
                Padding(
                    child: Text("Adult Father:\n${_adultFather}"),
                    padding: EdgeInsets.only(top: 30.0)),
                Padding(
                    child: Text("Json Encoded:\n${json.encode(_adultFather)}",
                        style: TextStyle(color: Colors.red)),
                    padding: EdgeInsets.only(top: 10.0)),
                FlatButton(
                    child: Text("Copy"),
                    onPressed: (() {
                      Clipboard.setData(
                          ClipboardData(text: "${json.encode(_adultFather)}"));
                    })),
                Padding(
                    child: Text("Adult No Children:\n${_adultNoChildren}"),
                    padding: EdgeInsets.only(top: 30.0)),
                Padding(
                    child: Text(
                        "Json Encoded:\n${json.encode(_adultNoChildren)}",
                        style: TextStyle(color: Colors.red)),
                    padding: EdgeInsets.only(top: 10.0)),
                FlatButton(
                    child: Text("Copy"),
                    onPressed: (() {
                      Clipboard.setData(ClipboardData(
                          text: "${json.encode(_adultNoChildren)}"));
                    })),
                Padding(
                    child: Text("Grandchild:\n${_grandchild}"),
                    padding: EdgeInsets.only(top: 30.0)),
                Padding(
                    child: Text("Json Encoded:\n${json.encode(_grandchild)}",
                        style: TextStyle(color: Colors.red)),
                    padding: EdgeInsets.only(top: 10.0)),
                FlatButton(
                    child: Text("Copy"),
                    onPressed: (() {
                      Clipboard.setData(
                          ClipboardData(text: "${json.encode(_grandchild)}"));
                    })),
              ],
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ));
  }
}

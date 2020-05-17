import 'package:flutter/material.dart';

import 'widgets/taps_widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Cat #1',
                icon: Icon(Icons.keyboard_arrow_left),
              ),
              Tab(
                text: 'Cat #1',
                icon: Icon(Icons.keyboard_arrow_up),
              ),
              Tab(
                text: 'Cat #1',
                icon: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Tab1(),
            Tab2(),
            Tab3(),
          ],
        ),
      ),
    );
  }
}

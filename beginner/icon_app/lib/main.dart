import 'package:flutter/material.dart';

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
      ),
      home: HomeWidget(title: 'Icon Example'),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Row row1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.add),
        const Text("Default size 24, default color black")
      ],
    );

    Row row2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.add, size: 48.0,),
        const Text("Default size 48, default color black")
      ],
    );

    Row row3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.add, size: 96.0, color: Colors.red,),
        const Text("Default size 96, default color red")
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          row1,
          row2,
          row3,
        ],
      ),
    );
  }
}

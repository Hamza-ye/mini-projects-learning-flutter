import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Builder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Future Builder Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String computeListOfTimestamps(int count) {
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < count; i++) {
      sb.writeln('${i + 1} : ${DateTime.now()}');
    }
    return sb.toString();
  }

  Future<String> createFutureCalculation(int count) {
    return new Future(() {
      return computeListOfTimestamps(count);
    });
  }

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showCalculation = false;

  void _onInvokeFuturePressed() {
    setState(() {
      _showCalculation = !_showCalculation;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = _showCalculation
        ? FutureBuilder(
            future: widget.createFutureCalculation(10000),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      '${snapshot.data == null ? "" : snapshot.data}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              } else {
                return Container(
                    child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    strokeWidth: 3.0,
                  ),
                ));
              }
            },
          )
        : Text('hit the button to show calculation');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[child],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onInvokeFuturePressed,
        tooltip: 'Invoke Future',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

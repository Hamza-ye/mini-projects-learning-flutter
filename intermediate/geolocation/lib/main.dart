import 'package:flutter/material.dart';

import 'gps_widget.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Using Geolocator"),
          ),
          body: const Center(
            child: GPSWidget(),
          )),
    );
  }
}

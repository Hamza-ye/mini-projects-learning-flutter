import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {

  OrderWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Info"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            Text("BikeCorp",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            Text("Atlanta",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(""),
            Text("Bicycle Parts",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text("12/1/2019 \$123.23",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

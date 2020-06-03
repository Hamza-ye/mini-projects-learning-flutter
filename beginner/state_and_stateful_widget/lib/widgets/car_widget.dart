import 'package:flutter/material.dart';
import 'package:state_and_stateful_widget/models/car.dart';

class CarWidget extends StatelessWidget {
  CarWidget(this._car) : super();
  final Car _car;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Column(children: <Widget>[
              Text('${_car.make} ${_car.model}',
                  style: TextStyle(fontSize: 24.0)),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.network(_car.imageSrc))
            ]))));
  }
}

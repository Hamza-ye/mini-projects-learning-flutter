import 'package:flutter/material.dart';

class Car {
  final String _make;
  final String _model;
  final String _imageSrc;
  const Car(this._make, this._model, this._imageSrc);
  operator ==(other) =>
      (other is Car) && (_make == other._make) && (_model == other._model);
  int get hashCode => _make.hashCode ^ _model.hashCode ^ _imageSrc.hashCode;
}

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
              Text('${_car._make} ${_car._model}',
                  style: TextStyle(fontSize: 24.0)),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.network(_car._imageSrc))
            ]))));
  }
}

import 'package:flutter/material.dart';

import '../models/grid_options.dart';

class CustomDialogWidget extends StatefulWidget {
  GridOptions _gridOptions;

  CustomDialogWidget(this._gridOptions) : super();

  @override
  _CustomDialogWidgetState createState() =>
      _CustomDialogWidgetState(GridOptions.copyOf(this._gridOptions));
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  int _counter = 0;
  GridOptions _gridOptions;

  _CustomDialogWidgetState(this._gridOptions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 250.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Grid Options',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Cross Axis Count Portrait"),
              Spacer(),
              DropdownButton<int>(
                value: _gridOptions.crossAxisCountPortrait,
                items: <int>[2, 3, 4, 5, 6].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gridOptions.crossAxisCountPortrait = newValue;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Cross Axis Count Landscape"),
              Spacer(),
              DropdownButton<int>(
                value: _gridOptions.crossAxisCountLandscape,
                items: <int>[2, 3, 4, 5, 6].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gridOptions.crossAxisCountLandscape = newValue;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Aspect Ratio"),
              Spacer(),
              DropdownButton<double>(
                value: _gridOptions.childAspectRatio,
                items: <double>[1.0, 1.5, 2.0, 2.5].map((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gridOptions.childAspectRatio = newValue;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Padding"),
              Spacer(),
              DropdownButton<double>(
                value: _gridOptions.padding,
                items: <double>[1.0, 2.0, 3.0, 4.0].map((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gridOptions.padding = newValue;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Spacing"),
              Spacer(),
              DropdownButton<double>(
                value: _gridOptions.spacing,
                items: <double>[1.0, 2.0, 4.0, 8.0, 16.0, 32.0].map((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gridOptions.spacing = newValue;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          FlatButton(
            child: Text("Apply"),
            onPressed: () => Navigator.pop(context, _gridOptions),
          )
        ],
      ),
    );
  }
}
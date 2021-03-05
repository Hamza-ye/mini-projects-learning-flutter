import 'package:flutter/material.dart';

void main() {
  runApp(ButtonApp());
}

class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Buttons Example'),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Row flatButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
            onPressed: () => debugPrint('FlatButton pressed'),
            child: Text('FlatButton')),
        const Text('FlatButton'),
      ],
    );

    Row raisedButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
            onPressed: () => debugPrint('RaisedButton pressed'),
            child: Text('RaisedButton')),
        const Text('RaisedButton'),
      ],
    );

    Row iconButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => debugPrint('IconButton pressed'),
          icon: Icon(Icons.add),
        ),
        const Text('IconButton'),
      ],
    );

    Row dropdownButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<String>(
          items: <String>['Men', 'Women']
              .map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (value) => debugPrint('Changed ${value}'),
        ),
        const Text('FlatButton'),
      ],
    );

    Row backButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BackButton(
            onPressed: () => debugPrint('BackButton pressed')),
        const Text('BackButton'),
      ],
    );

    Row closeButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CloseButton(
            onPressed: () => debugPrint('CloseButton pressed'),),
        const Text('CloseButton'),
      ],
    );

    Row outlineButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlineButton(
            onPressed: () => debugPrint('OutlineButton pressed'),
            child: Text('OutlineButton')),
        const Text('OutlineButton'),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          flatButtonRow,
          raisedButtonRow,
          iconButtonRow,
          dropdownButtonRow,
          outlineButtonRow,
          backButtonRow,
          closeButtonRow,
        ],
      ),
    );
  }
}

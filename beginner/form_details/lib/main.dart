import 'package:flutter/material.dart';

import 'models/person_info.dart';
import 'widgets/address_widget.dart';

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
  PersonInfo _address = PersonInfo.empty();

  @override
  _MyHomePageState createState() => _MyHomePageState(_address);
}

class _MyHomePageState extends State<MyHomePage> {
  PersonInfo _address;
  _MyHomePageState(this._address);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: AddressWidget(address: _address, onSaved: _onSaved),
            ),
          ],
        ),
      ),
    );
  }

  _onSaved(PersonInfo address) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Address'),
            content: Text(address.toString()),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Close'),
              )
            ],
          );
        });
  }
}

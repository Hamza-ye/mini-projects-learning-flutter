import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  final PleaseWaitWidget _pleaseWaitWidget =
      PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));
  final AppWidget _appWidget = AppWidget(key: ObjectKey("appWidget"));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _pleaseWait = false;

  void _togglePleaseWait() {
    setState(() {
      _pleaseWait = !_pleaseWait;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = _pleaseWait
        ? [
            widget._pleaseWaitWidget,
          ]
        : [widget._appWidget];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          key: ObjectKey('stack'),
          children: childWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _togglePleaseWait,
        label: Text('Please Wait On/Off'),
        icon: Icon(Icons.cached),
      ),
    );
  }
}

class PleaseWaitWidget extends StatelessWidget {
  PleaseWaitWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 8.0,
        ),
      ),
      color: Colors.grey.withOpacity(0.3),
    );
  }
}

class AppWidget extends StatelessWidget {
  AppWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Your', style: TextStyle(fontSize: 20.0)),
          const Text('App', style: TextStyle(fontSize: 20.0)),
          const Text('Goes', style: TextStyle(fontSize: 20.0)),
          const Text('Here', style: TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }
}

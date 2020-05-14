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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  BoxFit _boxFit = BoxFit.cover;

  void _showBoxFitDialog() async {
    BoxFit boxFit = await showDialog<BoxFit>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Select Box Fit"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Cover"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.cover);
                },
              ),
              SimpleDialogOption(
                child: Text("Contain"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.contain);
                },
              ),
              SimpleDialogOption(
                child: Text("Fill"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.fill);
                },
              ),
              SimpleDialogOption(
                child: Text("Fit Height"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.fitHeight);
                },
              ),
              SimpleDialogOption(
                child: Text("Fit Width"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.fitWidth);
                },
              ),
              SimpleDialogOption(
                child: Text("Scale Down"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.scaleDown);
                },
              ),
              SimpleDialogOption(
                child: Text("None"),
                onPressed: () {
                  Navigator.pop(context, BoxFit.none);
                },
              ),
            ],
          );
        });
    if (boxFit != null) {
      setState(() {
        _boxFit = boxFit;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> kittenTiles = [];
    for (var i = 200; i < 1000; i += 100) {
      String imageUrl = "http://placekitten.com/200/${i}";
      kittenTiles.add(GridTile(
        child: Image.network(imageUrl, fit: _boxFit),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            children: kittenTiles,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBoxFitDialog,
        child: Icon(Icons.select_all),
      ),
    );
  }
}

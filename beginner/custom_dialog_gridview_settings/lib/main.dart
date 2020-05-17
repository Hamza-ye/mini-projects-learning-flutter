import 'package:flutter/material.dart';
import 'models/grid_options.dart';
import 'widgets/custom_dialog_widget.dart';

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
      home: HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Widget> _kittenTiles = [];
  GridOptions _gridOptions = GridOptions(2, 3, 1.0, 4.0, 4.0);

  _HomeWidgetState() : super() {
    for (int i = 200; i < 1000; i += 100) {
      String imageUrl = "http://placekitten.com/200/${i}";
      _kittenTiles.add(GridTile(
          header: GridTileBar(
            title: Text("Cats", style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          footer: GridTileBar(
              title: Text("How cute",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          child: Image.network(imageUrl, fit: BoxFit.cover)));
    }
  }

  void _showGridOptionsDialog() async {
    GridOptions gridOptions = await showDialog<GridOptions>(
      context: context,
      builder: (context) {
        return Dialog(
          child: CustomDialogWidget(this._gridOptions),
        );
      },
    );
    if (gridOptions != null) {
      setState(() {
        _gridOptions = gridOptions;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait)
                ? _gridOptions.crossAxisCountPortrait
                : _gridOptions.crossAxisCountLandscape,
            childAspectRatio: _gridOptions.childAspectRatio,
            padding: EdgeInsets.all(_gridOptions.padding),
            mainAxisSpacing: _gridOptions.spacing,
            crossAxisSpacing: _gridOptions.spacing,
            children: _kittenTiles,
          );
        },
      ),
      bottomNavigationBar: Container(
          child: Text(_gridOptions.toString()), padding: EdgeInsets.all(20.0)),
      floatingActionButton: FloatingActionButton(
        onPressed: _showGridOptionsDialog,
        tooltip: 'Try more grid options',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}
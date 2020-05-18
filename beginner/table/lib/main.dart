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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    const TableRow tableRow = TableRow(
      children: [
        const Text(
          'tableRowText1waaaaaaaaaaaa',
          overflow: TextOverflow.fade,
        ),
        const Text(
          'tableRowText2waaaaaaaaaaaa',
          overflow: TextOverflow.fade,
        ),
        const Text(
          'tableRowText3waaaaaaaaaaaa',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Table(
        children: [
          tableRow,
          tableRow,
          tableRow,
          tableRow,
          tableRow,
          tableRow,
          tableRow,
          tableRow,
          tableRow,
        ],
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(0.1),
          1: FlexColumnWidth(0.3),
          2: FlexColumnWidth(0.6),
        },
        border: TableBorder.all(),
      ),
    );
  }
}

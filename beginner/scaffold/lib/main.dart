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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('Add Icon pressed');
            },
          )
        ],
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Body'),
        ],),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => debugPrint('Bottom Navigation Bar onTap: ${index}'),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Bottom Nav Bar Item 1'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Bottom Nav Bar Item 2'),
            )
          ],
        ),
        bottomSheet: Container(
          color: Colors.amberAccent,
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.update),
                  onPressed: () {
                  print('Bottom Sheet Icon Pressed');
                }),
              Text('Bottom Sheet Text')
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                      print('Drawer Item 1 Pressed');
                    },
                  ),
                Text('Drawer Item 1')
              ],),

              Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                      print('Drawer Item 2 Pressed');
                    },
                  ),
                Text('Drawer Item 2')
              ],)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton Pressed');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        persistentFooterButtons: <Widget>[
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
            print('Persistant Footer Icon Pressed');
          }),
          Text('Persistant Footer Text')
        ],
    );
  }
}

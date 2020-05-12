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
  int _selectedIndex = 0;
  static const TEXT_STYLE_NORMAL = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );
  static const TEXT_STYLE_SELECTED = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  final TextFormField _fontSizeTextField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.format_size),
          hintText: 'Font Size',
          labelText: 'Enter the font size'));

  final TextFormField _historyTextFormField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.history),
          hintText: 'Days',
          labelText: 'Enter days'));

  final TextFormField _languageTextFormField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.language),
          hintText: 'Language',
          labelText: 'Enter your language'));

  select(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String getSelectionTitle() {
    String title;
    switch (_selectedIndex) {
      case 0:
        title = "Accessibility";
        break;
      case 1:
        title = "History";
        break;
      case 2:
        title = "Language";
        break;
      default:
        {
          title = title + 'Settings';
        }
        break;
    }
    return title;
  }

  TextFormField getSelectionField() {
    TextFormField selectionTextFormField;
    switch (_selectedIndex) {
      case 0:
        selectionTextFormField = _fontSizeTextField;
        break;
      case 1:
        selectionTextFormField = _historyTextFormField;
        break;
      case 2:
        selectionTextFormField = _languageTextFormField;
        break;
    }
    return selectionTextFormField;
  }

  @override
  Widget build(BuildContext context) {
    final ListTile accessibilityListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'Accessibility',
        style: _selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('Accesibility Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(0),
    );

    final ListTile historyListTile = ListTile(
      leading: Icon(Icons.history),
      title: Text(
        'History',
        style: _selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('History Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(1),
    );

    final ListTile languageListTile = ListTile(
      leading: Icon(Icons.language),
      title: Text(
        'Language',
        style: _selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('Language Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(2),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            accessibilityListTile,
            historyListTile,
            languageListTile,
          ],
        ),
        bottomSheet: Container(
            color: Color(0xFFB3E5FC),
            padding: EdgeInsets.all(20.0),
            child: Container(
                constraints: BoxConstraints(maxHeight: 200.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text(getSelectionTitle()),
                    Expanded(child: getSelectionField())
                  ],
                ),
            )
        ),
    );
  }
}

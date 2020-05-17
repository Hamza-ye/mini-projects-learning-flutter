import 'package:expansion_panel/models/expansion_Panel_data.dart';
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

  @override
  _MyHomePageState createState() => _MyHomePageState([
        ExpansionPanelData(
            "Can I backup my data?", "dsfuysdiu fudsy fiusdyf ", false),
        ExpansionPanelData(
            "How can I increase my space?",
            "sydufy "
            "dsuiyfuidysu fusyufsdyuif ysudiy fuydsufy suyf udsy fu",
            false),
        ExpansionPanelData(
            "How do I cancel?",
            "ddsufysd yfds fsduyf sdyf "
                "sudyuy fsudyf sydyf dsy fdsuyf udsufy udsyfdsfyuysdf uyud",
            false),
        ExpansionPanelData(
            "How do I change language?",
            "udsuf sdifuu fdsuif "
                "uf dsufdisu fius wewqw qeqweqwyiquuiqweqwewqe weewe wewe",
            false),
        ExpansionPanelData(
            "How do I search?",
            "ooioio ioi oio i odsfudsifsdf"
                " dfdsfdsui idufu dsiuf isduf iduf idsu fisduf iusidf ",
            false),
        ExpansionPanelData(
            "How do I view on other devices?",
            "idusdf isu "
                "idsu idsu fisduf usyfuedy ewuyduyed uyeu dyeudy uweyu",
            false),
        ExpansionPanelData(
            "How do I view my history",
            "iirewy syfudy fu "
                "yfsduyfds yfdsuyf udsfydsufy sduyf dsuyf udsyf udsyuee",
            false),
        ExpansionPanelData(
            "Is my subscription cost going to go up?",
            "wieureiy dys udsyyf "
                "dsufy dusyfudsy fuysdu udsyuyfudsyfuewyrwreooioou  uiy",
            false)
      ]);
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<ExpansionPanelData> _expansionPanelData;

  _MyHomePageState(this._expansionPanelData);

  _onExppansion(int panelIndex, bool isExpanded) {
    // Toggle the expanded state. Using setState will force 'build' to fire.
    setState(() {
      _expansionPanelData[panelIndex].expanded = !_expansionPanelData[panelIndex].expanded;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Build the expansion panels from scratch every time the ui builds.
    // This is not as expensive as it sounds.
    List<ExpansionPanel> expansionPanels = [];

    for(int i=0, ii = _expansionPanelData.length; i < ii; i++) {
      var expansionPanelData = _expansionPanelData[i];
      expansionPanels.add(ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              expansionPanelData.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            expansionPanelData.body,
            style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
          ),
        ),
        isExpanded: expansionPanelData.expanded,
      ));
    }
    return Scaffold(
        appBar: new AppBar(
          title: new Text("FAQs"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24.0),
            child: ExpansionPanelList(
              children: expansionPanels,
              expansionCallback: _onExppansion,
            ),
          ),
        ),
      );
  }
}

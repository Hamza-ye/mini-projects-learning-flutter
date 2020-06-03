import 'package:flutter/material.dart';
import 'package:state_and_stateful_widget/widgets/car_widget.dart';

import 'models/car.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState("Cars");
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  List<Car> _cars;

  _MyHomePageState(this.title) {
    _cars = [
      Car("Bmw", "M3",
          "Https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg"),
      Car("Nissan", "GTR",
          "Https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg"),
      Car("Nissan", "Sentra",
          "Https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg")
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<CarWidget> carWidgets = _cars.map((Car car) => CarWidget(car)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: carWidgets,
      ),
    );
  }
}

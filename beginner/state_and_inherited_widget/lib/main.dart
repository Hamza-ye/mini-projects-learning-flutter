import 'package:flutter/material.dart';
import 'package:state_and_inherited_widget/models/car_model.dart';
import 'package:state_and_inherited_widget/widgets/model_binding.dart';

import 'models/car.dart';

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
      home: ModelBinding<CarModel>(
        initialModel: const CarModel(
          const [
            Car(
              'Bmw',
              'M3',
              'Https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg',
            ),
            Car(
              'Nissan',
              'GTR',
              'Https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg',
            ),
            Car(
              'Nissan',
              'Sentra',
              'Https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg',
            )
          ],
        ),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    CarModel model = ModelBinding.of(context);
    List<CarWidget> carWidgets = model.carList.map((Car car) {
      return CarWidget(car);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                List<Car> carList = List.from(model.carList);

                carList.add(Car(
                  'Nissan',
                  'Sentra',
                  'Https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg',
                ));

                ModelBinding.update(context, new CarModel(carList));
              })
        ],
      ),
      body: ListView(children: carWidgets),
    );
  }
}

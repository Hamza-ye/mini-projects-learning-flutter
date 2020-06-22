import 'car.dart';
import 'package:collection/collection.dart';

class CarModel {
  const CarModel(this.carList);
  final List<Car> carList;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other.runtimeType != runtimeType) {
      return false;
    } else {
      final CarModel otherModel = other;
      return IterableEquality().equals(otherModel.carList, carList);
    }
  }

  int get hashCode => carList.hashCode;
}
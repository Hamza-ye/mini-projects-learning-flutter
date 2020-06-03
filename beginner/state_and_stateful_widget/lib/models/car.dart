class Car {
  String _make;
  String _model;
  String _imageSrc;

  Car(this._make, this._model, this._imageSrc);

  operator ==(other) =>
      (other is Car) && (_make == other._make) && (_model == other._model);

  int get hashCode => _make.hashCode ^ _model.hashCode ^ _imageSrc.hashCode;

  get make => this._make;
  get model => this._model;
  get imageSrc => this._imageSrc;
  
}

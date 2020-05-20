class PersonInfo {
  String _fname = "";
  String _lname = "";
  String _sex = "m";
  String _addr1 = "";
  String _addr2 = "";
  String _city = "";
  String _state = "";
  String _zip = "";
  bool _fiveYears = false;
  DateTime _dob;

  PersonInfo(this._fname, this._lname, this._sex, this._addr1, this._addr2,
      this._city, this._state, this._zip, this._fiveYears, this._dob);

  PersonInfo.empty();

  String get fname => _fname;
  String get lname => _lname;
  String get sex => _sex;
  String get addr1 => _addr1;
  String get addr2 => _addr2;
  String get city => _city;
  String get state => _state;
  String get zip => _zip;
  bool get fiveYears => _fiveYears;
  DateTime get dob => _dob;

  @override
  String toString() {
    return 'PersonInfo{_fname: $_fname, _lname: $_lname, _sex: $_sex, _addr1: $_addr1, _addr2: $_addr2, _city: $_city, _state: $_state, _zip: $_zip, _fiveYears: $_fiveYears, _dob: $_dob}';
  }
  
}

class ExpansionPanelData {
  String _title;
  String _body;
  bool _expanded;

  ExpansionPanelData(this._title, this._body, this._expanded);

  String get title => _title;
  
  @override
  String toString() {
    return 'ExpansionPanelData{_title: $_title, _body: $_body, _expanded: $_expanded}';
  }

  String get body => _body;

  bool get expanded => _expanded;

  set expanded(bool value) {
    _expanded = value;
  }
}

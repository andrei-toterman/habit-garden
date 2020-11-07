class Flower{

  String _name; //name
  int _degradationLevel; // degradation level
  List _assets; // assets

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get degradationLevel => _degradationLevel;

  List get assets => _assets;

  set assets(List value) {
    _assets = value;
  }

  set degradationLevel(int value) {
    _degradationLevel = value;
  }
}
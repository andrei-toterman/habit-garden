import 'flower.dart';

class TrackedHabit {

  int _uniqueId; // unique id for tracked habit
  String _title; // title
  String _description; // description for tracked habit
  List _reminders; // list of dates and times for reminders
  Flower _flower; // associated flower
  List _statuses; // list of completion statuses
  DateTime _creationdate; // creation date

  TrackedHabit(this._uniqueId,this._title,this._description,this._reminders,this._flower,this._statuses,this._creationdate);


  DateTime get creationdate => _creationdate;

  set creationdate(DateTime value) {
    _creationdate = value;
  } // getter for uniqueId
  int get uniqueId => _uniqueId;

  //setter for uniqueId
  set uniqueId(int value) {
    _uniqueId = value;
  }

  String get title => _title;

  List get statuses => _statuses;

  set statuses(List value) {
    _statuses = value;
  }

  Flower get flower => _flower;

  set flower(Flower value) {
    _flower = value;
  }

  List get reminders => _reminders;

  set reminders(List value) {
    _reminders = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set title(String value) {
    _title = value;
  }

  TrackedHabit.fromJson(Map<String,dynamic> json)
              : _uniqueId = json['uniqueId'],
                _title = json['title'],
                _description = json['description'],
                _reminders = json['reminders'],
                _flower = json['flower'],
                _statuses = json['status'],
                _creationdate = DateTime.parse(json['creationdate']);

  Map<String,dynamic> toJson() =>
      {
          'uniqueId': _uniqueId,
          'title': _title,
          'description': _description,
          'reminders': _reminders,
          'flower': _flower,
          'status': _statuses,
          'creationdate': _creationdate
      };

}
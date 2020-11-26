import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_garden/models/schedule_entry.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class ScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Schedule', style: TextStyle(fontSize: 20, color: Colors.black)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: context
                .select<TrackedHabit, List<ScheduleEntry>>(
                    (t) => [...t.schedules])
                .map((e) => TimeCard(e))
                .toList(),
          ),
        ),
        TimeDaySelect(),
      ],
    );
  }
}

class TimeCard extends StatelessWidget {
  final ScheduleEntry entry;

  const TimeCard(this.entry, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            '${(entry.hour < 10 ? '0' : '') + entry.hour.toString()}:${(entry.minute < 10 ? '0' : '') + entry.minute.toString()}',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          GestureDetector(
            child: Icon(Icons.highlight_remove_outlined, color: Colors.black),
            onTap: () => context.read<TrackedHabit>().removeSchedule(entry),
          ),
        ],
      ),
    );
  }
}

class TimeDaySelect extends StatefulWidget {
  @override
  _TimeDaySelectState createState() => _TimeDaySelectState();
}

class _TimeDaySelectState extends State<TimeDaySelect> {
  final List<bool> selectedDays = List.filled(7, false);
  int hour;
  int minute;

  @override
  void initState() {
    super.initState();
    hour = context.read<TrackedHabit>().creationDate.hour;
    minute = context.read<TrackedHabit>().creationDate.minute;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSpinner(
                  value: hour,
                  mod: 24,
                  onChanged: (newHour) => setState(() => hour = newHour)),
              Text(
                ':',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              buildSpinner(
                  value: minute,
                  mod: 60,
                  onChanged: (newMinute) => setState(() => minute = newMinute)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: selectedDays,
                onPressed: (index) =>
                    setState(() => selectedDays[index] = !selectedDays[index]),
                borderColor: Colors.black,
                fillColor: Colors.black,
                selectedColor: Colors.white,
                borderWidth: 3,
                selectedBorderColor: Colors.black,
                textStyle: TextStyle(color: Colors.black, fontSize: 17),
                children: [
                  Text('Mon'),
                  Text('Tue'),
                  Text('Wed'),
                  Text('Thu'),
                  Text('Fri'),
                  Text('Sat'),
                  Text('Sun'),
                ],
              ),
              GestureDetector(
                child:
                    Icon(Icons.add_box_outlined, size: 45, color: Colors.black),
                onTap: () {
                  context.read<TrackedHabit>().addSchedule(ScheduleEntry(
                      hour,
                      minute,
                      selectedDays
                          .asMap()
                          .entries
                          .where((e) => e.value)
                          .map((e) => e.key)
                          .toSet()));
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Column buildSpinner({int value, int mod, Function(int) onChanged}) {
    return Column(
      children: [
        GestureDetector(
          child: Icon(Icons.arrow_drop_up, color: Colors.black, size: 35),
          onTap: () => onChanged(++value % mod),
        ),
        Text(
          '${value < 10 ? '0' + value.toString() : value.toString()}',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        GestureDetector(
          child: Icon(Icons.arrow_drop_down, color: Colors.black, size: 35),
          onTap: () => onChanged(--value % mod),
        ),
      ],
    );
  }
}

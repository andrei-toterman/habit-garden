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
        Text(
          'Schedule',
          style: TextStyle(fontSize: 20, color: Color(0xff30452D)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 50,
          child: Selector<TrackedHabit, List<ScheduleEntry>>(
            selector: (_, t) => [...t.schedules],
            builder: (_, schedules, __) => ListView(
              scrollDirection: Axis.horizontal,
              children: schedules.map((e) => TimeCard(e)).toList(),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xffA5A58D),
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
            style: TextStyle(color: Color(0xff30452D), fontSize: 20),
          ),
          GestureDetector(
            child:
                Icon(Icons.highlight_remove_outlined, color: Color(0xff30452D)),
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
                style: TextStyle(color: Color(0xff30452D), fontSize: 30),
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
                borderRadius: BorderRadius.circular(20),
                borderColor: Color(0xff30452D),
                selectedBorderColor: Color(0xff30452D),
                fillColor: Color(0xff657153),
                selectedColor: Color(0xff30452D),
                color: Color(0xff30452D),
                borderWidth: 3,
                textStyle: TextStyle(fontSize: 17),
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
                child: Icon(Icons.add_box_outlined,
                    size: 45, color: Color(0xff30452D)),
                onTap: () {
                  final days = selectedDays
                      .asMap()
                      .entries
                      .where((e) => e.value)
                      .map((e) => e.key)
                      .toSet();
                  context
                      .read<TrackedHabit>()
                      .addSchedule(ScheduleEntry(hour, minute, days));
                },
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffA5A58D),
      ),
    );
  }

  Widget buildSpinner({int value, int mod, Function(int) onChanged}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            child:
                Icon(Icons.arrow_drop_up, color: Color(0xff30452D), size: 35),
            onTap: () => onChanged(++value % mod),
          ),
          Text(
            '${(value < 10 ? '0' : '') + value.toString()}',
            style: TextStyle(
              color: Color(0xff30452D),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            child:
                Icon(Icons.arrow_drop_down, color: Color(0xff30452D), size: 35),
            onTap: () => onChanged(--value % mod),
          ),
        ],
      ),
    );
  }
}

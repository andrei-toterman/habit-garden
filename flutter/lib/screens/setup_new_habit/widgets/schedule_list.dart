import 'package:flutter/material.dart';
import 'package:habit_garden/models/schedule_entry.dart';

class ScheduleList extends StatefulWidget {
  final List<ScheduleEntry> schedules;

  const ScheduleList(this.schedules, {Key key}) : super(key: key);

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.schedules.map((t) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '${t.hour}:${t.minute}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => pickTime(),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.add_box_outlined, color: Colors.black, size: 35),
          ),
        ),
      ],
    );
  }

  void pickTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      ScheduleEntry entry = ScheduleEntry.fromTimeOfDay(time);
      setState(() {
        widget.schedules.add(entry);
      });
    }
  }
}

class TimeCard extends StatelessWidget {
  final ScheduleEntry entry;

  const TimeCard(this.entry, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text(
            '${entry.hour}:${entry.minute}',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/pages/setup_new_habit.dart';

class NewHabitList extends StatelessWidget {
  final List<NewHabit> newHabits;

  const NewHabitList({Key key, @required this.newHabits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: newHabits.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
          height: 0,
          color: Colors.black,
        ),
        itemBuilder: (BuildContext context, int index) => NewHabitCard(
          model: newHabits[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SetupNewHabit(
                model: newHabits[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewHabitCard extends StatelessWidget {
  final NewHabit model;
  final onTap;

  NewHabitCard({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("icon",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(model.description),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.add_box_outlined,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}

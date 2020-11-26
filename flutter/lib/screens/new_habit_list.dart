import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_new_habit.dart';

class NewHabitList extends StatelessWidget {
  final List<NewHabit> newHabits;

  const NewHabitList(this.newHabits, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: newHabits.length,
        separatorBuilder: (context, index) =>
            Divider(thickness: 2, height: 0, color: Colors.black),
        itemBuilder: (_, index) => NewHabitCard(
          model: newHabits[index],
          onTap: () => Navigator.push(
            _,
            MaterialPageRoute(builder: (_) => SetupNewHabit(newHabits[index])),
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
            decoration: BoxDecoration(border: Border.all(width: 3)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                model.description,
                softWrap: true,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.add_box_outlined, size: 35),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}

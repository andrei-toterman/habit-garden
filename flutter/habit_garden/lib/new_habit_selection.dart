import 'package:flutter/material.dart';
import 'package:habit_garden/possible_habit_model.dart';
import 'package:habit_garden/setup_new_habit.dart';

class NewHabitSelectionScreen extends StatelessWidget {
  final List<PossibleHabitModel> possibleHabitModels;

  const NewHabitSelectionScreen({Key key, @required this.possibleHabitModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: possibleHabitModels.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
          height: 0,
          color: Colors.black,
        ),
        itemBuilder: (BuildContext context, int index) => PossibleHabitListItem(
          model: possibleHabitModels[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SetupNewHabit(
                model: possibleHabitModels[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PossibleHabitListItem extends StatelessWidget {
  final PossibleHabitModel model;
  final onTap;

  PossibleHabitListItem({Key key, this.model, this.onTap}) : super(key: key);

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

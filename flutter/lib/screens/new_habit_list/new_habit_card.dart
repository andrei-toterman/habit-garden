import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';

class NewHabitCard extends StatelessWidget {
  final NewHabit model;
  final onTap;

  NewHabitCard({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5).copyWith(right: 20),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
            child: Text(
              "icon",
              style: TextStyle(fontSize: 20, color: Color(0xff30452D)),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 3, color: Color(0xff30452D)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff30452D),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  model.description,
                  style: TextStyle(fontSize: 17, color: Color(0xff30452D)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.add_box_outlined,
                size: 40,
                color: Color(0xff30452D),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffA5A58D),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}

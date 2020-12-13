import 'package:flutter/material.dart';
import 'package:habit_garden/screens/garden/garden.dart';
import 'package:habit_garden/screens/new_habit_list/new_habit_list.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffFFF1E6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DrawerItem(title: 'Garden', route: Garden.route),
            DrawerItem(title: 'Add Habit', route: NewHabitList.route),
            DrawerItem(title: 'Profile'),
            DrawerItem(title: 'Shop'),
            DrawerItem(title: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String route;

  const DrawerItem({Key key, @required this.title, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null && route.isNotEmpty) {
          Navigator.pop(context);
          if (route != ModalRoute.of(context).settings.name)
            Navigator.pushNamed(context, route);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        alignment: Alignment.center,
        height: 100,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff30452D),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffA5A58D),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

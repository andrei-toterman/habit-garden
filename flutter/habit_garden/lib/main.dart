import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HabitSelectionList(),
    );
  }
}

class HabitSelectionList extends StatelessWidget {
  final int items = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: items,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 2,
            height: 0,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context, int index) {
            return HabitSelectionItem(
              title: 'Habit $index',
              subtitle: 'Shot habit description $index',
            );
          },
      ),
    );
  }
}

class HabitSelectionItem extends StatelessWidget {
  final String title;
  final String subtitle;

  HabitSelectionItem({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Placeholder(fallbackWidth: 100, color: Colors.black),
              decoration: BoxDecoration(
                border: Border.all(width: 3),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: GoogleFonts.dosis(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                this.subtitle,
                style: GoogleFonts.dosis(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () => print(this.title),
            child: Container(
              height: double.infinity,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.add_circle_rounded,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

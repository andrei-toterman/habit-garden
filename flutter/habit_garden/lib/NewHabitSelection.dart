import 'package:flutter/material.dart';

class NewHabitSelectionList extends StatelessWidget {
  final items = [
    for (int i = 0; i < 10; i++)
      {
        'title': 'Possible habit $i',
        'desc': 'Short habit description $i',
      }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
          height: 0,
          color: Colors.black,
        ),
        itemBuilder: (BuildContext context, int index) {
          return NewHabitSelectionItem(
            title: items[index]['title'],
            description: items[index]['desc'],
          );
        },
      ),
    );
  }
}

class NewHabitSelectionItem extends StatelessWidget {
  final String title;
  final String description;

  NewHabitSelectionItem({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Habit icon", style: TextStyle(fontSize: 15)),
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: TextStyle(fontSize: 25),
              ),
              Text(this.description),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () => print(this.title),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.add_circle_outline_rounded,
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

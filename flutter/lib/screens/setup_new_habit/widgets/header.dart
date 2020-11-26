import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String icon;

  const Header({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(icon, style: TextStyle(fontSize: 20)),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
            ),
          ),
        ),
      ],
    );
  }
}

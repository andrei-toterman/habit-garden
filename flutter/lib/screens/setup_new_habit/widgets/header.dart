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
          child: Text(
            'icon',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff30452D),
            ),
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xffA5A58D),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff30452D),
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xffA5A58D),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}

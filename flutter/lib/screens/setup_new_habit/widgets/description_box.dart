import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class DescriptionBox extends StatefulWidget {
  final String initialDescription;

  const DescriptionBox({Key key, this.initialDescription}) : super(key: key);

  @override
  _DescriptionBoxState createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController()
      ..text = widget.initialDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: Colors.black,
        controller: descriptionController,
        onChanged: (d) => context.read<TrackedHabit>().description = d,
        style: TextStyle(fontSize: 20, color: Color(0xff30452D)),
        decoration: InputDecoration(
          hintText: 'custom user description',
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xffA5A58D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}

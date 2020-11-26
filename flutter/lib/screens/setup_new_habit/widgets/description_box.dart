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
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
          hintText: 'custom user description',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
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

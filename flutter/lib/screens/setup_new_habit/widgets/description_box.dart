import 'package:flutter/material.dart';

class DescriptionBox extends StatefulWidget {
  final Function(String description) updateDescription;
  final String initialDescription;

  const DescriptionBox(this.updateDescription,
      {Key key, this.initialDescription})
      : super(key: key);

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
        onChanged: (String description) {
          widget.updateDescription(description);
        },
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

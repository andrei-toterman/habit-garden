import 'package:flutter/material.dart';

class FlowerPicker extends StatefulWidget {
  final Function(String type) updateFlowerType;
  final flowerTypes = ['type1', 'type2', 'type3'];

  FlowerPicker({Key key, this.updateFlowerType}) : super(key: key);

  @override
  _FlowerPickerState createState() => _FlowerPickerState();
}

class _FlowerPickerState extends State<FlowerPicker> {
  int currentFlower = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (drag) {
        setState(() {
          currentFlower = (currentFlower + drag.primaryVelocity.sign.toInt()) %
              widget.flowerTypes.length;
        });
        widget.updateFlowerType(widget.flowerTypes[currentFlower]);
      },
      child: Container(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        child: Text(
          widget.flowerTypes[currentFlower],
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 3),
        ),
      ),
    );
  }
}

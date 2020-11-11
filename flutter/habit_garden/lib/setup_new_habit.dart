import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:habit_garden/possible_habit_model.dart';

class SetupNewHabit extends StatefulWidget {
  final PossibleHabitModel model;

  const SetupNewHabit({Key key, this.model}) : super(key: key);

  @override
  _SetupNewHabitState createState() => _SetupNewHabitState();
}

class _SetupNewHabitState extends State<SetupNewHabit> {
  final flowerPaths = ['flower_0.png', 'flower_1.png', 'flower_2.png']
      .map((path) => Text(
            path,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ))
      .toList();

  int currentFlowerIndex = 0;
  double difficulty = 2;
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.model.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("icon", style: TextStyle(fontSize: 20)),
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
                    widget.model.title,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (drag) {
                  var nextFlowerIndex =
                      currentFlowerIndex - drag.primaryVelocity.sign.toInt();
                  if (0 <= nextFlowerIndex &&
                      nextFlowerIndex <= flowerPaths.length - 1) {
                    setState(() {
                      currentFlowerIndex = nextFlowerIndex;
                    });
                  }
                },
                child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  child: flowerPaths[currentFlowerIndex],
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    cursorColor: Colors.black,
                    controller: descriptionController,
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
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'difficulty',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Slider(
            min: 0,
            max: 4,
            divisions: 4,
            value: difficulty,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            onChanged: (double value) {
              setState(() {
                difficulty = value;
              });
            },
          ),
          HoursListForDay(day: 'mon'),
          HoursListForDay(day: 'tue'),
          HoursListForDay(day: 'wed'),
          HoursListForDay(day: 'thu'),
          HoursListForDay(day: 'fri'),
          HoursListForDay(day: 'sat'),
          HoursListForDay(day: 'sun'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => print('add'),
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3)),
          child: Text(
            'add',
            style: TextStyle(color: Colors.black, fontSize: 20),
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

class HoursListForDay extends StatefulWidget {
  final String day;

  HoursListForDay({Key key, this.day}) : super(key: key);

  @override
  _HoursListForDayState createState() => _HoursListForDayState();
}

class _HoursListForDayState extends State<HoursListForDay> {
  List<TimeOfDay> times = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 50,
      child: Row(
        children: [
          Container(
            width: 110,
            child: Text(
              widget.day,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: times.map((t) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text(
                      '${t.hour}:${t.minute}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => pickTime(),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        times.add(time);
      });
    }
  }
}

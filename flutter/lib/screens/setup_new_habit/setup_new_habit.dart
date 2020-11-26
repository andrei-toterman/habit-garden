import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/description_box.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/difficulty.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/flower_picker.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/header.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/schedule_list.dart';
import 'package:provider/provider.dart';

class SetupNewHabit extends StatelessWidget {
  final NewHabit newHabit;

  const SetupNewHabit(this.newHabit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrackedHabit.fromNewHabit(newHabit),
      builder: (context, _) => Scaffold(
        body: Column(
          children: [
            Header(title: newHabit.title, icon: "icon"),
            SizedBox(height: 10),
            Row(
              children: [
                FlowerPicker(),
                SizedBox(width: 10),
                Expanded(
                  child:
                      DescriptionBox(initialDescription: newHabit.description),
                ),
              ],
            ),
            SizedBox(height: 10),
            Difficulty(),
            SizedBox(height: 10),
            ScheduleList(),
            Spacer(),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              onTap: () => context
                  .read<AppState>()
                  .addTrackedHabit(context.read<TrackedHabit>()),
            )
          ],
        ),
      ),
    );
  }
}

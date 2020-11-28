import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/app_drawer.dart';
import 'package:habit_garden/screens/garden/garden.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/description_box.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/difficulty.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/flower_picker.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/header.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/schedule_list.dart';
import 'package:provider/provider.dart';

class SetupNewHabit extends StatelessWidget {
  static const route = '/setup_new_habit';

  @override
  Widget build(BuildContext context) {
    final NewHabit newHabit = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider(
      create: (_) => TrackedHabit.fromNewHabit(newHabit),
      builder: (context, _) => Scaffold(
        backgroundColor: Color(0xffFFF1E6),
        drawer: AppDrawer(),
        resizeToAvoidBottomInset: false,
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
              onTap: () {
                context
                  .read<AppState>()
                  .addTrackedHabit(context.read<TrackedHabit>());
                Navigator.popUntil(context, ModalRoute.withName(Garden.route));
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Color(0xff30452D),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffA5A58D),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

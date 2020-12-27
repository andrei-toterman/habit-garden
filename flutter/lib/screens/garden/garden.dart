import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../database.dart';
import '../../navbar.dart';
import '../../styles.dart';
import 'widgets/garden_flower.dart';

class Garden extends StatelessWidget {
  static const route = 'garden';

  @override
  Widget build(BuildContext context) {
    final habits = context
        .select<Database, Stream<Iterable<TrackedHabit>>>((db) => db.habits);

    return Scaffold(
      backgroundColor: BG_COLOR,
      bottomNavigationBar: NavigationBar(),
      body: StreamBuilder<Iterable<TrackedHabit>>(
        stream: habits,
        builder: (_, snapshot) => Align(
          alignment: Alignment(0, 0.7),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset("assets/garden.svg"),
                ...?snapshot.data?.map((e) => GardenFlower(e)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

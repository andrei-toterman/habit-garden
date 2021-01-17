import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:habit_garden/models/completion_status.dart';

import 'models/tracked_habit.dart';

class Database extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String _uid;
  ValueNotifier<CollectionReference> _userHabits = ValueNotifier(null);

  Database(Stream<String> uidStream) {
    final stream = uidStream.listen((newUid) {
      if (_userHabits.value == null || _uid != newUid) {
        _userHabits.value = _db.collection("users/$newUid/habits");
        _uid = newUid;
        notifyListeners();
      }
    });

    stream.onDone(() {
      stream.cancel();
      print("user stream canceled");
    });
  }

  Stream<Iterable<TrackedHabit>> get habits => _userHabits.value
      ?.snapshots()
      ?.map((list) => list.docs.map((doc) => TrackedHabit.fromFirebase(doc)));

  addHabit(TrackedHabit habit) => _userHabits.value?.add(habit.toJson());

  changeFlowerCoords(String id, double x, double y) =>
      _userHabits.value?.doc(id)?.update({
        "flower.x": x,
        "flower.y": y,
      });

  changeFlowerType(String id, String type) =>
      _userHabits.value?.doc(id)?.update({"flower.type": type});

  changeFlowerHealth(String id, double health) =>
      _userHabits.value?.doc(id)?.update({"flower.health": health});

  changeDescription(String id, String description) =>
      _userHabits.value?.doc(id)?.update({"description": description});

  addCompletionStatus(String id, CompletionStatus status) =>
      _userHabits.value?.doc(id)?.collection("history")?.add(status.toJson());

  Future<Iterable<CompletionStatus>> getCompletionHistory(String id) async {
    final history = await _userHabits.value
        ?.doc(id)
        ?.collection("history")
        ?.orderBy("timestamp")
        ?.get();
    return history.docs.map((json) => CompletionStatus.fromJson(json.data()));
  }

  clearSchedule(String id) =>
      _userHabits.value?.doc(id)?.update({"schedule": []});

  deleteUserData(String uid) {
    _userHabits.value.get().then((habits) {
      for (var habit in habits.docs) {
        habit.reference.collection("history").get().then((history) {
          for (var entry in history.docs) {
            entry.reference.delete();
          }
        });
        habit.reference.delete();
      }
    });
  }
}

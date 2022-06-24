import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../Classes/HiveBoxes.dart';

final selectedDayProvider =
    StateNotifierProvider<SelectDayController, DateTime?>((ref) {
  return SelectDayController();
});

class SelectDayController extends StateNotifier<DateTime?> {
  SelectDayController() : super(null);

  void change(DateTime time) {
    //print("test");
    state = time;
  }
}

final hiveProvider = FutureProvider<HiveDB>((_) => HiveDB.create());

class HiveDB {
  var _events;

  HiveDB._create() {}

  static Future<HiveDB> create() async {
    final component = HiveDB._create();
    await component._init();
    return component;
  }

  _init() async {
    Hive.registerAdapter(EventsBoxAdapter());
    this._events =
        await Hive.openBox<Map<DateTime, List<CleanCalendarEvent>>>('events');
  }

  storeUser(Map<DateTime, List<CleanCalendarEvent>> eventsMap) {
    this._events.put('events', eventsMap);
  }

  EventsBox getUser() {
    return this._events.get('events');
  }
}

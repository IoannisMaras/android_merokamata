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
  late Box _events;

  HiveDB._create() {}

  static Future<HiveDB> create() async {
    final component = HiveDB._create();
    await component._init();
    return component;
  }

  _init() async {
    Hive.registerAdapter(EventsBoxAdapter());
    _events = await Hive.openBox<EventsBox>('events');
  }

  storeEvent(List<CleanCalendarEvent> events,DateTime index) {
    String dateToString = index.day.toString() +index.month.toString() + index.year.toString();
    _events.put(dateToString,events);
  }

  List<CleanCalendarEvent> getEvents(DateTime index) {

    String dateToString = index.day.toString() +index.month.toString() + index.year.toString();
    
    List<CleanCalendarEvent> temp = _events.get(dateToString,defaultValue: null);
    return temp;
  }
}

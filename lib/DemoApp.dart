import 'package:android_merokamata/Providers/CalendarProviders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
//import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoApp extends ConsumerStatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends ConsumerState<DemoApp> {
  DateTime? selectedDay;

  List<CleanCalendarEvent>? selectedEvent;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
      CleanCalendarEvent('Event Δ',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 11, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  void _handleData(date, Ref) {
    print(date);
    ref.read(selectedDayProvider.notifier).change(date);
    // setState(() {
    //   //selectedDay = date;
    //   selectedEvent = events[selectedDay] ?? [];
    // });
    //print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedDay = ref.watch(selectedDayProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Calendar(
            startOnMonday: true,
            selectedColor: Colors.blue,
            todayColor: Colors.green,
            eventColor: Colors.pink,
            eventDoneColor: Colors.amber,
            bottomBarColor: Colors.blue,
            onRangeSelected: (range) {
              print('selected Day ${range.from},${range.to}');
            },
            onDateSelected: (date) {
              return _handleData(date, ref);
            },
            events: events,
            isExpandable: true,
            //dayBuilder: DayBuilder(),
            isExpanded: true,
            dayOfWeekStyle: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
              //fontWeight: FontWeight.w100,
            ),
            bottomBarTextStyle: const TextStyle(
              color: Colors.white,
            ),
            hideBottomBar: true,
            hideArrows: false,
            weekDays: ['Δευ', 'Τρί', 'Τετ', 'Πεμ', 'Παρ', 'Σαβ', 'Κυρ'],
            eventListBuilder:
                (BuildContext context, List<CleanCalendarEvent> event) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: event.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Text(event[index].summary),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

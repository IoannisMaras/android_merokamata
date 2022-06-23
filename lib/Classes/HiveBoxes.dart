import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:hive/hive.dart';
part 'HiveBoxes.g.dart';

@HiveType(typeId: 0)
class EventsBox extends HiveObject {
  EventsBox({required this.date, required this.eventsList});
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  List<CleanCalendarEvent> eventsList;
}

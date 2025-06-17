import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;
  final String description;

  const Event(this.title, this.description);

  @override
  String toString() => '$title - $description';
}

final events = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
part of '../configs.dart';

final _date = DateFormat("MMM dd, y");
final _dateTimeWords = DateFormat("MMM. dd, yyyy KK:mmaaa");
final _dateTimeDigits = DateFormat("MM/dd/yyyy KK:mmaaa");

extension SuperDate on DateTime {
  DateTime get today => DateTime(year, month, day);

  DateTime get endOfDay => add(const Duration(days: 1)).subtract(Duration(
        hours: hour,
        minutes: minute,
        seconds: second,
        milliseconds: millisecond,
        microseconds: microsecond,
      ));

  String get date => _date.format(this);

  String get dateTimeWords => _dateTimeWords.format(toLocal());

  String get dateTimeDigits => _dateTimeDigits.format(toLocal());

  int get age => DateTime.now().year - year;
}

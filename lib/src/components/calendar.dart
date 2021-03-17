import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ui_bits/src/ui_bits_internal.dart';

class BitCalendar extends StatefulWidget {
  final void Function(CalendarSlot) onTap;
  final double startHour;
  final double endHour;
  final Future<List<Meeting>> meetings;

  const BitCalendar({
    Key key,
    this.onTap,
    this.meetings,
    this.startHour = 0,
    this.endHour = 24,
  }) : super(key: key);

  @override
  _BitCalendarState createState() => _BitCalendarState();
}

class _BitCalendarState extends State<BitCalendar> {
  @override
  Widget build(BuildContext context) {
    return BitFutureDataBuilder<List<Meeting>>(
      future: widget.meetings,
      onData: (value) => SfCalendar(
        onTap: (calendarTapDetails) {
          widget.onTap?.call(CalendarSlot(
            dateTime: calendarTapDetails.date,
            meeting: calendarTapDetails.appointments?.cast<Meeting>()?.first,
          ));
        },
        view: CalendarView.workWeek,
        timeSlotViewSettings: TimeSlotViewSettings(
          startHour: widget.startHour,
          endHour: widget.endHour,
          nonWorkingDays: <int>[DateTime.sunday],
        ),
        dataSource: MeetingDataSource(value),
        firstDayOfWeek: 1,
        showNavigationArrow: true,
        showDatePickerButton: true,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
      ),
    );
  }
}

abstract class Recurrence {
  final DateTime appStartTime;
  final DateTime appEndTime;

  Recurrence(this.appStartTime, this.appEndTime);

  @override
  String toString() {
    return SfCalendar.generateRRule(
      getRecurrence(),
      appStartTime ?? DateTime.now(),
      appEndTime ?? DateTime.now(),
    );
  }

  RecurrenceProperties getRecurrence();
}

abstract class WeekDay {
  WeekDays getWeekDay();

  static WeekDay monday = _MondayWeekDay();
  static WeekDay tuesday = _TuesdayWeekDay();
  static WeekDay wednesday = _WednesdayWeekDay();
  static WeekDay thursday = _ThursdayWeekDay();
  static WeekDay friday = _FridayWeekDay();
  static WeekDay saturday = _SaturdayWeekDay();
  static WeekDay sunday = _SundayWeekDay();
}

class _MondayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.monday;
}

class _TuesdayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.tuesday;
}

class _WednesdayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.wednesday;
}

class _ThursdayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.thursday;
}

class _FridayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.friday;
}

class _SaturdayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.saturday;
}

class _SundayWeekDay implements WeekDay {
  @override
  WeekDays getWeekDay() => WeekDays.sunday;
}

class WeeklyRecurrence extends Recurrence {
  final DateTime startDate;
  final DateTime endDate;
  final List<WeekDay> weekDays;

  WeeklyRecurrence({
    this.startDate,
    this.endDate,
    this.weekDays,
    DateTime appStartTime,
    DateTime appEndTime,
  }) : super(appStartTime, appEndTime);

  @override
  RecurrenceProperties getRecurrence() {
    var recurrence = RecurrenceProperties();
    recurrence.recurrenceType = RecurrenceType.weekly;
    recurrence.interval = 1;
    recurrence.recurrenceRange =
        endDate == null ? RecurrenceRange.noEndDate : RecurrenceRange.noEndDate;
    recurrence.startDate = startDate;
    recurrence.endDate = endDate;
    recurrence.weekDays = weekDays.map((e) => e.getWeekDay()).toList();
    return recurrence;
  }
}

class DailyRecurrence extends Recurrence {
  final DateTime startDate;
  final DateTime endDate;

  DailyRecurrence({
    this.startDate,
    this.endDate,
    DateTime appStartTime,
    DateTime appEndTime,
  }) : super(appStartTime, appEndTime);

  @override
  RecurrenceProperties getRecurrence() {
    var recurrence = RecurrenceProperties();
    recurrence.recurrenceType = RecurrenceType.daily;
    recurrence.interval = 1;
    recurrence.recurrenceRange =
        endDate == null ? RecurrenceRange.noEndDate : RecurrenceRange.noEndDate;
    recurrence.startDate = startDate;
    recurrence.endDate = endDate;
    return recurrence;
  }
}

class MeetingDataSource extends CalendarDataSource {
  final List<Meeting> source;
  MeetingDataSource(this.source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getRecurrenceRule(int index) {
    return source[index].recurrence?.toString();
  }
}

class Meeting {
  Meeting({
    this.eventName,
    this.from,
    this.to,
    this.background,
    this.isAllDay,
    this.recurrence,
    this.data,
  });

  Recurrence recurrence;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  Object data;

  Meeting copy({
    DateTime from,
    DateTime to,
  }) {
    return Meeting(
      recurrence: recurrence,
      background: background,
      data: data,
      eventName: eventName,
      isAllDay: isAllDay,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  bool operator ==(Object other) {
    return toString() == other?.toString();
  }

  @override
  String toString() {
    return {
      'recurrence': recurrence?.toString(),
      'eventName': eventName,
      'from': from,
      'to': to,
      'background': background,
      'isAllDay': isAllDay,
      'data': data?.toString(),
    }.toString();
  }
}

class CalendarSlot {
  final DateTime dateTime;
  final Meeting meeting;

  CalendarSlot({
    DateTime dateTime,
    Meeting meeting,
  })  : this.meeting = _resetDateTimes(meeting, _getDate(dateTime)),
        this.dateTime = _getDate(dateTime);

  static DateTime _getDate(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  static Meeting _resetDateTimes(Meeting meeting, DateTime dateTime) {
    if (meeting == null) {
      return null;
    }
    return meeting.copy(
      from: _calculateDateTime(meeting.from, dateTime),
      to: _calculateDateTime(meeting.to, dateTime),
    );
  }

  static DateTime _calculateDateTime(DateTime other, DateTime dateTime) {
    return _addToDateTime(other, dateTime);
  }

  static DateTime _addToDateTime(DateTime other, DateTime dateTime) {
    return dateTime.add(Duration(
      hours: other.hour,
      minutes: other.minute,
    ));
  }
}

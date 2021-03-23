import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ui_bits/ui_bits.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DatePickerPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var durationField = Field.as<Duration>();
    durationField.onChange((data) {
      print(data);
    });
    return Container(
      child: Column(
        children: [
          BitDurationPicker(
            field: durationField,
            min: const Duration(minutes: 30),
            max: const Duration(hours: 5),
          ),
          BitDatePicker(),
          BitCalendar(
            meetings: SynchronousFuture(_getDataSource()),
            onTap: (slot) {
              print(slot?.dateTime);
              print(slot?.meeting);
            },
          ),
        ],
      ),
    );
  }

  Meeting makeMeeting(String label, int hour, int duration, Color color) {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, hour);
    final DateTime endTime = startTime.add(Duration(hours: duration));

    return Meeting(
      eventName: label,
      from: startTime,
      to: endTime,
      background: color,
      isAllDay: false,
      recurrence: DailyRecurrence(
        startDate: startTime,
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    return [
      makeMeeting('Tiago Silva\nFisioterapia', 9, 2, Colors.blue),
      makeMeeting('Raquel Coelho\nTerapia da Fala', 15, 1, Colors.red),
      Meeting(
        eventName: 'Diego Pereira\nFisioterapia',
        from: startTime,
        to: endTime,
        background: Colors.green,
        isAllDay: false,
        recurrence: WeeklyRecurrence(
          startDate: startTime,
          appStartTime: startTime,
          appEndTime: endTime,
          weekDays: [
            WeekDay.monday,
            WeekDay.wednesday,
          ],
        ),
      ),
      Meeting(
        eventName: 'Diego Pereira\nFisioterapia',
        from: DateTime(today.year, today.month, today.day, 13, 0, 0),
        to: DateTime(today.year, today.month, today.day, 14, 0, 0),
        background: Colors.yellow,
        isAllDay: false,
      ),
    ];
  }
}

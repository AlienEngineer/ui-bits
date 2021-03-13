import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ui_bits/ui_bits.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DatePickerPageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pinField = Field.asText();
    return Container(
      child: Column(
        children: [
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

  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    return [
      Meeting(
        eventName: 'Tiago Silva\nFisioterapia',
        from: startTime,
        to: endTime,
        background: Colors.blue,
        isAllDay: false,
        recurrence: DailyRecurrence(
          startDate: startTime,
        ),
      ),
      Meeting(
        eventName: 'Raquel Coelho\nTerapia da Fala',
        from: startTime,
        to: endTime,
        background: Colors.red,
        isAllDay: false,
        recurrence: DailyRecurrence(
          startDate: startTime,
          appStartTime: startTime,
          appEndTime: endTime,
        ),
      ),
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
    ];
  }
}

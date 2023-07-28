import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  String title;
  Event(this.title);
}

class calendar extends StatefulWidget {
  calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023,7,13) : [ Event('title'), Event('title2') ],
    DateTime.utc(2023,7,14) : [ Event('title3') ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: focusedDay,
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          // 선택된 날짜의 상태를 갱신합니다.
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (DateTime day) {
          // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
          return isSameDay(selectedDay, day);
        },
        calendarStyle: CalendarStyle(
          markerSize: 10.0,
          markerDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
        ),
        eventLoader: _getEventsForDay,
      ),
    );
  }

}

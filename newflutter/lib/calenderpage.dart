import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Event{
  String title;
  Event(this.title);
}

class calender extends StatefulWidget {
  const calender({Key? key}) : super(key: key);

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023,7,13) : [ Event('title'), Event('title2') ],
    DateTime.utc(2023,7,14) : [ Event('title3') ],
  };

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        SizedBox(height: 70,),
        Container(
          child: TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: DateTime.now(),
            calendarStyle: CalendarStyle(
              markerSize: 10.0,
              markerDecoration: BoxDecoration(
                color: Color(0xFF57642B),
                shape: BoxShape.circle
              )
            ),
            eventLoader: getEventsForDay,
            onDaySelected: (DateTime selectedDay, DateTime focusedDay){
              setState(() {
                this.selectedDay = selectedDay;
                this.focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (DateTime day){
              return isSameDay(selectedDay, day);
            },
            daysOfWeekHeight: 30,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
          ),
        ),
      ],
    ));
  }
}

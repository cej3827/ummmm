import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selecyedDate;

  @override
  void initState(){
    super.initState();
    _selecyedDate = _focusedDay;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableCalendar(
        events: _events,
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
          todayDecoration: BoxDecoration(color: Color(0xFFFFA84E),shape: BoxShape.circle),
          selectedDecoration: BoxDecoration(color: Color(0xFF788648),shape: BoxShape.circle),
          markerSize: 10.0,
          markerDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
        ),

        eventLoader: _getEventsForDay,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
  _showAddDialog(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: TextField(
        controller: _eventController,
      ),
      actions: <Widget>[
        TextButton(
          child: Text("save"),
          onPressed: (){
            if(_eventController.text.isEmpty) return;
            if(_events[_builders.selectedDay]!=null){

            }
          },
        )
      ],
    )
    );
  }
}



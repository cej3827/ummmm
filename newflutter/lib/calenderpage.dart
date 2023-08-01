import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class calendar extends StatefulWidget {
  calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents(){
    mySelectedEvents = {
      "2023-08-17" : [
        {"eventDesc": "hao", "eventTitle": "ddd"},
        {"eventDesc": "hao", "eventTitle": "ddd"}
      ],
      "2023-08-23" : [
        {"eventDesc": "1111", "eventTitle": "ddd"}
      ]
    };
  }


  List _listOfDayEvents(DateTime dateTime){
    if(mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!=null){
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    }else{
      return [];
    }
  }

  _showAddEventDialog() async{
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('새 일정', textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF57642B),fontWeight: FontWeight.bold),),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: '제목',
                ),
              ),
              TextField(
                controller: descController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: '세부 사항',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: ()=>Navigator.pop(context),
                child: const Text('취소',style: TextStyle(color: Color(0xFF57642B),fontWeight: FontWeight.bold),),
            ),
            TextButton(
                onPressed: (){
                  if(titleController.text.isEmpty && descController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Required title and description'),
                        duration: Duration(seconds: 2),
                      )
                    );
                    return;
                  }else{
                    print(titleController.text);
                    print(descController.text);

                    setState(() {
                      if(mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)]!=null){
                        mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDate!)
                        ]?.add({
                          "eventTitle": titleController.text,
                          "eventDesc": descController.text,
                        });
                      }else{
                        mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)]=[
                          {
                            "eventTitle": titleController.text,
                            "eventDesc": descController.text,
                          }
                        ];
                      }
                      print("New Event for backend developer ${json.encode(mySelectedEvents)}");
                      titleController.clear();
                      descController.clear();
                      Navigator.pop(context);
                      return;
                    });
                  }
                },
                child:Text('확인',style: TextStyle(color: Color(0xFF57642B),fontWeight: FontWeight.bold),),
            )
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          TableCalendar(
              locale: 'ko_KR',
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2023,01,01),
              lastDay: DateTime.utc(2023,12,31),
              calendarFormat: _calendarFormat,

              onDaySelected: (selectedDay, focusedDay){
                if(!isSameDay(_selectedDate, selectedDay)){
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF788648),
                  shape: BoxShape.circle
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF57642B),
                    shape: BoxShape.circle
                ),
                markerDecoration: BoxDecoration(
                    color: Color(0xFFFFA84E),
                    shape: BoxShape.circle
                )
              ),
              selectedDayPredicate: (day){
                return isSameDay(_selectedDate, day);
              },//날짜 선택하면 색상 생기는 코드 onday부터
              onPageChanged: (focusedDay){
                _focusedDay = focusedDay;
              },//스와이프나 화살표 무르면 이전달이나 다음달로 넘어감
              eventLoader: _listOfDayEvents,
          ),
          ..._listOfDayEvents(_selectedDate!).map(
              (myEvents)=>ListTile(
                leading: const Icon(
                  Icons.done,
                  color: Color(0xFF57642B),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Event Title: ${myEvents['eventTitle']}'),
                ),
                subtitle: Text('Description: ${myEvents['eventDesc']}'),
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFFA84E),
          onPressed: ()=> _showAddEventDialog(),
          label: const Text('+',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}



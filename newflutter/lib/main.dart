import 'package:flutter/material.dart';
import 'style.dart' as style;
import 'question.dart';
import 'questionlist.dart';
import 'mypage.dart';
import 'calenderpage.dart';
import 'login.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  await initializeDateFormatting();
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("하냥"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: [question(), qlist(), calendar(), mypage()][tab],

      bottomNavigationBar: BottomNavigationBar(

        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: tab,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '오늘의 질문',
            icon: Icon(Icons.help_outline,),
            activeIcon: Icon(Icons.help),
          ),
          BottomNavigationBarItem(
            label: '질문 리스트',
            icon: Icon(Icons.list_alt_outlined, ),
            activeIcon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            label: '캘린더',
            icon: Icon(Icons.calendar_month_outlined, ),
            activeIcon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: 'MY',
            icon: Icon(Icons.perm_identity_outlined, ),
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  } // build
} //_MyAppState
import 'package:flutter/material.dart';
import 'style.dart' as style;
import 'question.dart';
import 'questionlist.dart';

void main() {
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
        // 상단바
        title: Text("애오니"),
        centerTitle: true,
        //backgroundColor: Colors.white,
        leading: IconButton(
          // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: [question(), qlist(), Text('calender'), Text('My')][tab],

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

      ), // 하단바 달기
    );
  } // build
} //_MyAppState

/*
class bottombar extends StatelessWidget {
  // 하단바 위젯
  bottombar({Key? key}) : super(key: key);

  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (i) {
        setState(() {
          tab = i;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(Icons.help_outline),
          activeIcon: Icon(Icons.help),
        ),
        BottomNavigationBarItem(
          label: '샵',
          icon: Icon(Icons.list_alt_outlined),
          activeIcon: Icon(Icons.list_alt),
        ),
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
        ),
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(Icons.perm_identity_outlined),
          activeIcon: Icon(Icons.person),
        ),
      ],
    );
  } // build
} // bottombar
*/
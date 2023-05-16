import 'package:flutter/material.dart';
import 'style.dart' as style;

void main() {
  runApp(
      MaterialApp(
          theme: style.theme,
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  @override
  build(context) {
  return Scaffold(
  appBar: AppBar(
  // 상단바
  title: Text("애오니"),
  centerTitle: true,
  backgroundColor: Colors.white,
  leading: IconButton(// 뒤로가기 버튼
  onPressed: () {Navigator.pop(context);},
  icon: Icon(Icons.arrow_back),
  ),
  ),
  body: [question(),Text('list'),Text('calender'),Text('My')][tab],
  bottomNavigationBar: bottombar(), // 하단바 달기
  );
  } // build
} //_MyAppState

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

class question extends StatelessWidget {
  const question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 50), // 상하좌우 여백주기
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                "오늘의 질문",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( // 사이 여백 주기
              height: 90,
            ),
            SizedBox(
              child: Text(
                "Q. 오늘 뭐 먹었어?",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
            SizedBox( // 사이 여백 주기
              height: 30,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD05DFF),
                  fixedSize: Size(130, 50),
                ),
                child: Text(
                  "답변하기",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {}, // 버튼 누르는 효과
              ),
            ),
            SizedBox( // 사이 여백 주기
              height: 90,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.account_circle, size: 40, color: Colors.cyan,),
                  Icon(Icons.account_circle, size: 40, color: Colors.red,),
                  Icon(Icons.account_circle, size: 40, color: Colors.blue),
                  Icon(Icons.account_circle, size: 40, color: Colors.amber),
                  Icon(Icons.account_circle, size: 40, color: Colors.brown,),
                  Icon(Icons.account_circle, size: 40, color: Colors.green),
                ],
              ),
            ),
          ], // children
        ),
      ),
    );
  }
}

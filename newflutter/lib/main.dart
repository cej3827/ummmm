import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(
            color: Color(0xFFD05DFF), // 전체 아이콘 색상
          ),
          fontFamily: 'cafe' // 전체 폰트
          ),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        // 상단바
        title: Text(
          "애오니",
          style: TextStyle(
            color: Color(0xFFD05DFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back), color: Color(0xFFD05DFF),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 50),  // 상하좌우 여백주기
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
              SizedBox(  // 사이 여백 주기
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
              SizedBox(  // 사이 여백 주기
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
                  onPressed: () {},  // 버튼 누르는 효과
                ),
              ),
              SizedBox(  // 사이 여백 주기
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
            ],  // children
          ),
        ),
      ),
      bottomNavigationBar: bottombar(),  // 하단바 달기
    );
  }  // build
}  //_MyAppState

class bottombar extends StatelessWidget {  // 하단바 위젯
  const bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.help, size: 40,),
            Icon(Icons.list_alt, size: 40,),
            Icon(Icons.calendar_month_outlined, size: 40,),
            Icon(Icons.person, size: 40,),
          ],  // children
        ),
      ),
    );
  }  // build
}  // bottombar

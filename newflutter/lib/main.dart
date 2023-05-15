import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
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
        title: Text(
          "앱이름",
          style: TextStyle(color: Color(0xFFD05DFF)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Color(0xFFD05DFF),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              SizedBox(
                child: Text(
                  "오늘의 질문",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500,),
                ),
              ),
              SizedBox(height: 90,),
              SizedBox(
                height: 40,
                child: Text(
                  "Q.오늘 뭐 먹었어?",
                  style: TextStyle(
                    color: Color(0xFFD05DFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 40,),
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD05DFF),
                    fixedSize: Size(130, 40),
                  ),
                  child: Text("답변하기",style: TextStyle(fontSize: 20),),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 90,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person,size: 30,),
                    Icon(Icons.person,size: 30,),
                    Icon(Icons.person,size: 30,),
                    Icon(Icons.person,size: 30,),
                    Icon(Icons.person,size: 30,),
                    Icon(Icons.person,size: 30,),
                  ],
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottombar(),
    );
  }
}

class bottombar extends StatelessWidget {
  const bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.help,
              size: 40,
              color: Color(0xFFD05DFF),
            ),
            Icon(
              Icons.list_alt,
              size: 40,
              color: Color(0xFFD05DFF),
            ),
            Icon(
              Icons.calendar_month_outlined,
              size: 40,
              color: Color(0xFFD05DFF),
            ),
            Icon(
              Icons.person,
              size: 40,
              color: Color(0xFFD05DFF),
            ),
          ],
        ),
      ),
    );
  }
}

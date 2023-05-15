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
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.purple,
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("오늘의 질문"),
            ),
            Center(
                child: Text(
              "Q.오늘 뭐 먹었어?",
              style: TextStyle(color: Colors.purple),
            )),
            Center(
              child: ElevatedButton(
                child: Text("답변하기"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BAB(),
    );
  }
}

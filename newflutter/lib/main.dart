import 'package:flutter/material.dart';
import 'package:newflutter/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  build(context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text("앱이름",style: TextStyle(color: Colors.purple),),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context); //뒤로가기
                  },
                  color: Colors.purple,
                  icon : Icon(Icons.arrow_back)
              ),
            ),

            body: TabBarView(
              children: [
                Container(
                  child: Text("오늘의 질문"),
                ),
                Container(
                  child: Text("질문리스트"),
                ),
                Container(
                  child: Text("캘린더"),
                ),
                Container(
                  child: Text("MY"),
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            bottomNavigationBar: BottomBar(),
          )
      ),
    );
  }
}



import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home : MyApp()
  ));
}

class MyApp extends StatefulWidget{
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  build(context) {
    return Scaffold(
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
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.home),],
        ),
        body: Text("내가 해냄ㄷㅂ"),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
                Icon(Icons.star),
              ],
            )
          ),
        ),
      ),
    );
  }
}*/
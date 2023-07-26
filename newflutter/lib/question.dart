import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';


final String now = new DateTime.now().toString();
String formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());

//오늘의 질문 창
class question extends StatelessWidget {
  question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30), // 상하좌우 여백주기
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Color(0x83CBCCCA),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),//여백
              Container(margin: EdgeInsets.fromLTRB(0, 0, 120, 0),
                child: Text('$formattedDate', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
                ),//날짜 변경 해야함
              ),

              SizedBox(height: 10,), //여백
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF788648),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 300,
                height: 300,
                child: Center(
                  child : Text("므아아아아앙",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 35),),
                ),
              ),
              SizedBox(
                // 사이 여백 주기
                height: 30,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA84E),
                    fixedSize: Size(200, 40),
                  ),
                  child: Text(
                    "답변하기",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color : Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext con) {
                          return AlertDialog(
                            title: Text("오늘 뭐 먹었어?"),
                            content: SingleChildScrollView(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(40)),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("제출"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("취소"),
                              ),
                            ],
                          );
                        });
                  }, // 버튼 누르는 효과
                ),
              ),
              /*SizedBox(
                // 사이 여백 주기
                height: 10,
              ),*/

            ], // children
          ),
        ),
      ),
    );
  }
}

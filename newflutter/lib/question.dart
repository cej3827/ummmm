import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

/*void check_time(BuildContext context){
  var now = new DateTime.now();
  String formatDate = DateFormat('yy /MM /dd').format(now);
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$formatDate'),
      )
  );
}*/

var timeZoneOffset = DateTime.now().timeZoneOffset.inMilliseconds;
var localTimestamp = (DateTime.now().millisecondsSinceEpoch + timeZoneOffset);
var unixTimestamp = DateTime.now().millisecondsSinceEpoch;






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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                height: 120,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                color: Color(0x83CBCCCA),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                        Text("이예원", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),//여백
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  String formatDate = DateFormat('yy /MM /dd').format(DateTime.now());
                  ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
              content: Text('$formatDate'),
            )
        );
                ),
              ),

              SizedBox(height: 10,), //여백
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  " : 오늘 뭐 먹었어?",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal, color : Color(
                      0xFF788648)),
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
                    fixedSize: Size(400, 40),
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
              SizedBox(
                // 사이 여백 주기
                height: 10,
              ),

            ], // children
          ),
        ),
      ),
    );
  }
}

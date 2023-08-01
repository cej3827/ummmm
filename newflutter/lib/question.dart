import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';


final String now = new DateTime.now().toString();
String formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFFA84E),
      fixedSize: Size(200, 40),
    ),
      child: Text(
        "${isCompleted == true ? '수정하기' : '답변하기'}",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color : Colors.white),
      ),
      onPressed: () {
        showDialog<String>(
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
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState((){
                        isCompleted == true ? isCompleted = false : isCompleted = true;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text("제출"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("취소"),
                  ),
                ],
              );
            });
      }, // 버튼 누르는 효과
    );
  }
}

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
                height: 90,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
              SizedBox(height: 20,),//여백
              Container(margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: Text('$formattedDate', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold,),
                ),//날짜 변경 해야함
              ),

              SizedBox(height: 10,), //여백
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF788648),
                  borderRadius: BorderRadius.circular(15)
                ),
                width: 290,
                height: 290,
                child: Center(
                  child : Text("므아아아아앙",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 35),),
                ),
              ),
              SizedBox(
                // 사이 여백 주기
                height: 15,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: MyAlertDialog(),
              ),


            ], // children
          ),
        ),
      ),
    );
  }
}

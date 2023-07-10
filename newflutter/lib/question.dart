import 'package:flutter/material.dart';

//오늘의 질문 창
class question extends StatelessWidget {
  const question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 50), // 상하좌우 여백주기
        child: SingleChildScrollView(
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
                    color : Color(
                        0xFF788648)
                  ),
                ),
              ),
              SizedBox(
                // 사이 여백 주기
                height: 90,
              ),
              SizedBox(
                child: Text(
                  "Q. 오늘 뭐 먹었어?",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal, color : Color(
                      0xFF788648)),
                ),
              ),
              SizedBox(
                // 사이 여백 주기
                height: 30,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA84E),
                    fixedSize: Size(130, 50),
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
                height: 90,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.account_circle, size: 40, color: Color(0xFF57642B),),
                    Icon(Icons.account_circle, size: 40, color: Color(0xFF788648),),
                    Icon(Icons.account_circle, size: 40, color: Color(0xFFFFA84E),),
                    Icon(Icons.account_circle, size: 40, color: Color(0xFF788648),),
                    Icon(Icons.account_circle, size: 40, color: Color(0xFF57642B),),
                    Icon(Icons.account_circle, size: 40, color: Color(0xFFFFA84E),),
                  ],
                ),
              ),
            ], // children
          ),
        ),
      ),
    );
  }
}

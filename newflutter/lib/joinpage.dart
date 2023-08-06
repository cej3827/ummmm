import 'package:flutter/material.dart';
import 'login.dart';

class join extends StatefulWidget {
  const join({Key? key}) : super(key: key);

  @override
  State<join> createState() => _joinState();
}

class _joinState extends State<join> {
  final joinId = TextEditingController();
  final joinPw = TextEditingController();
  final joinPwCheck = TextEditingController();
  final joinPn = TextEditingController();
  final joinBd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                width: 350,
                height: 550,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ), //회원가입
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextField(
                              controller: joinId,
                              decoration: InputDecoration(
                                  hintText: '아이디 입력 (5 - 10자)', labelText: '아이디'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextField(
                              controller: joinPw,
                              decoration: InputDecoration(
                                  hintText: '비밀번호 입력(문자, 숫자 포함 8-20자)', labelText: '비밀번호'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextField(
                              controller: joinPwCheck,
                              decoration: InputDecoration(hintText: '비밀번호 재입력', labelText: '비밀번호 확인'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextField(
                              controller: joinPn,
                              decoration: InputDecoration(
                                  hintText: "전화번호 입력 ( '-' 제외 11자리 입력)", labelText: '전화번호'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextField(
                              controller: joinBd,
                              decoration: InputDecoration(hintText: '생년월일 입력', labelText: '생년월일'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        children: [
                          Text('이용약관 동의'),
                          Text('마케팅 정보 수신 동의'),
                        ],
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>MyLogin())
                            );
                          },
                          child: Text('계정 생성',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(
                              0xFF727272),fixedSize: Size(250, 30))
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newflutter/groupselect.dart';
import 'package:newflutter/idFind.dart';
import 'package:newflutter/joinpage.dart';
import 'package:newflutter/main.dart';
import 'package:newflutter/question.dart';
import 'style.dart' as style;
import 'package:intl/date_symbol_data_local.dart';
import 'joinpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Info> fetchInfo() async{
  var url = 'http://43.202.31.89:8080/user/login';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    print('응답했다');
    print(json.decode(response.body));
    return Info.fromJson(json.decode(response.body));
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('계좌정보를 불러오는데 실패했습니다');
  }
}

class Info {
  final String userId;
  final String userPw;

  Info(
      {required this.userId,
        required this.userPw,});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      userId: json["userId"],
      userPw: json["userPw"],
    );
  }
}

void main() async {
  await initializeDateFormatting();
  runApp(MaterialApp(theme: style.theme, home: MyLogin()));
}

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}


class _MyLoginState extends State<MyLogin> {
  var tab = 0;
  Future<Info>? info;
  @override
  void initState(){
    super.initState();
    info = fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      body: Center(
        child: FutureBuilder<Info>(
          future: info,
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return buildColumn(snapshot);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}에러!!");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  } // build
}

Widget buildColumn(snapshot){
  return Center(
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
            height: 450,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 7,
                        height: 60,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: '아이디'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: '비밀번호'),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                                context as BuildContext,
                                MaterialPageRoute(builder: (context)=>const idFindPage())
                            );
                          },
                          child: (Text('아이디/비밀번호 찾기',style: TextStyle(fontSize: 13,color: Color(0xFFFFA84E)),))
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context as BuildContext,
                                MaterialPageRoute(builder: (context)=>const groupSelect())
                            );
                          },
                          child: Text('로그인',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(
                              0xFF727272),fixedSize: Size(200, 30))
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context as BuildContext,
                                MaterialPageRoute(builder: (context)=>const join())
                            );
                          },
                          child: Text('새 계정 만들기',style: TextStyle(fontSize:17,color: Colors.black,fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(
                              0xFFB6B6B6),fixedSize: Size(200, 30))
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
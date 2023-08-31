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

/*
final loginId = TextEditingController();
final loginPw = TextEditingController();
*/
String loginId ='';
String loginPw = '';

class User {
  final String user_ID;
  final String user_PW;
  //final Map<String, dynamic> company;

  User({required this.user_ID,required this.user_PW,/*required this.company*/});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_ID: json['user_ID'],
      user_PW: json['user_PW'],
      //company: userMap['company'],
    );
  }
}

Future<User> fetchUser() async{
  final response = await http.get(Uri.https('http://43.202.31.89:8080/user/login'));

  if(response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
  throw Exception('데이터 수신 실패');}
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

  late Future<User> user;

  @override
  void initState(){
    super.initState();
    user = fetchUser();
  }
  //final loginId = TextEditingController();
  //final loginPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            return SingleChildScrollView(
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
                                        context,
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
                                    if(snapshot.hasData){
                                      print(snapshot.data!.user_ID);
                                      print(snapshot.data!.user_PW);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=>const groupSelect())
                                      );}
                                    else if(snapshot.hasError){
                                      print('에러');
                                      print(snapshot.data!.user_ID);
                                      print(snapshot.data!.user_PW);
                                    };
                                  },
                                  child: Text('로그인',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                                  style: ElevatedButton.styleFrom(backgroundColor: Color(
                                      0xFF727272),fixedSize: Size(200, 30))
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
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
            );
          }
        
        ),
    ),
    );
  } // build
}

Widget buildColumn(snapshot) {
  return Column();
}

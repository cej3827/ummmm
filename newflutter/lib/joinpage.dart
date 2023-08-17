import 'package:flutter/material.dart';
import 'login.dart';

class join extends StatefulWidget {
  const join({Key? key}) : super(key: key);

  @override
  State<join> createState() => _joinState();
}

class _joinState extends State<join> {

  String _ID = '';
  String _PW = '';
  String _checkPW = '';
  String _PN = '';
  String _BD = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _isAgree = false;
  bool? _isMarketing = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF788648),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                height: 620,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
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
                            width: 95,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ), //회원가입
                    //SizedBox(
                      //height: 20,
                    //),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '아이디',
                                      hintText: '아이디(5-10자)',
                                    ),
                                    maxLength: 10,
                                    validator: (value){
                                      if(value!.isEmpty) {
                                        return '아이디가 비어있습니다.';
                                      }
                                      if(value!.length < 5){
                                        return '아이디는 5자 이상입니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _ID = value!;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '비밀번호',
                                      hintText: '비밀번호(8-20자)',
                                    ),
                                    maxLength: 20,
                                    validator: (value){
                                      if(value!.isEmpty) {
                                        return '비밀번호가 비어있습니다.';
                                      }
                                      if(value!.length < 8){
                                        return '비밀번호는 5자 이상입니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _PW = value!;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '비밀번호 확인',
                                      hintText: '비밀번호 재입력',
                                    ),
                                    maxLength: 20,
                                    validator: (_checkPW){
                                      if(_checkPW!.isEmpty) {
                                        return '비밀번호가 비어있습니다.';
                                      }
                                      if(_checkPW != _PW){
                                        return '비밀번호가 일치하지 않습니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _checkPW = value!;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '전화번호',
                                      hintText: "전화번호('-'제외 11자)",
                                    ),
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    validator: (value){
                                      if(value!.isEmpty) {
                                        return '전화번호가 비어있습니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _PN = value!;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '생년월일',
                                      hintText: '생년월일(8자)',
                                    ),
                                    maxLength: 8,
                                    keyboardType: TextInputType.number,
                                    validator: (value){
                                      if(value!.isEmpty) {
                                        return '생년월일이 비어있습니다.';
                                      }
                                      if(value!.length != 8){
                                        return '생년월일은 8자입니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _BD = value!;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('      이용약관 동의'),
                                      Checkbox(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                                          fillColor: const MaterialStatePropertyAll(Color(0xFF788648)),
                                          value: _isAgree, onChanged: (value){
                                        setState(() {
                                          _isAgree = value;
                                        });
                                      }),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('     마케팅 정보 수신 동의'),
                                      Checkbox(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                                          fillColor: const MaterialStatePropertyAll(Color(0xFF788648)),
                                          value: _isMarketing, onChanged: (value){
                                        setState(() {
                                          _isMarketing = value;
                                        });
                                      }),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if(!_formKey.currentState!.validate()){
                                          return;
                                        }
                                        _formKey.currentState?.save();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyLogin())
                                        );
                                      },
                                      child: Text('계정 생성',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                                      style: ElevatedButton.styleFrom(backgroundColor: Color(
                                          0xFF727272),fixedSize: Size(250, 30))
                                  ),
                                ],
                              ),
                            ),
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
    )
    );
  }
}


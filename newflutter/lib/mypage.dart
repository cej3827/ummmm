import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, MaterialPageRoute<dynamic>?> routes = {
  'route_screen': null,
  'route_second_screen': null,
  'route_third_screen' : null,
  'route_forth_screen' :null,
};

void addRoute({
  required String screen,
  required Function(MaterialPageRoute route) callback,
}){
  MaterialPageRoute? route;
  switch(screen){
    case 'route_screen':
      route = MaterialPageRoute(builder: (context)=>mypage());
      break;
    case 'route_second_screen':
      route = MaterialPageRoute(builder: (context)=> const editMemberInformation());
      break;
    case 'route_third_screen':
      route = MaterialPageRoute(builder: (context)=> const announcement());
      break;
    case 'route_fourth_screen':
      route = MaterialPageRoute(builder: (context)=> const privacy());
      break;
  }
  routes[screen] = route;
  callback(route!);
}

void removwRoute(BuildContext context, String screen){
  if(routes[screen] !=null){
    Navigator.removeRoute(context, routes[screen]!);
    routes[screen]=null;
  }
}

class mypage extends StatefulWidget {
  mypage({Key? key}) : super(key: key);

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {

  bool _isChecked=false;

  @override
  void initState(){
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.account_circle, size: 70, color: Colors.black45,),
                      Text("이예원", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                        addRoute(screen: "route_second_screen",
                        callback: (route) => Navigator.push(context,route),
                      );
                    },
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFD3A5),fixedSize: Size(400, 30)),
                        child: Text("회원정보수정",style: TextStyle(color: Color(0xFF57642B),fontSize: 20, fontWeight: FontWeight.bold,),)
                    )
                  ],
                ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("알림 ON/OFF",style: TextStyle(color: Color(0xFF57642B),height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD3A5),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: Offset(1,1),
                        )
                      ],
                    ),
                    width: 250, height: 35,
                  ),
                  SizedBox(width: 40,),
                  CupertinoSwitch(
                      value: _isChecked,
                      activeColor: CupertinoColors.activeGreen,
                      onChanged: (bool? value){
                        setState((){
                          _isChecked = value ??false;
                        });
                      },

                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    addRoute(screen: "route_third_screen",
                      callback: (route) => Navigator.push(context,route),
                    );
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFD3A5),fixedSize: Size(400, 30)),
                      child: Text("공지사항",style: TextStyle(color: Color(0xFF57642B),fontSize: 20, fontWeight: FontWeight.bold,),)
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    addRoute(screen: "route_fourth_screen",
                      callback: (route) => Navigator.push(context,route),
                    );
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFD3A5),fixedSize: Size(400, 30)),
                      child: Text("개인정보 처리방침",style: TextStyle(color: Color(0xFF57642B),fontSize: 20, fontWeight: FontWeight.bold,),)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//회워정보수정 탭
class editMemberInformation extends StatelessWidget {
  const editMemberInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원정보수정"),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child:Icon(Icons.account_circle, size: 70, color: Colors.black45,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("닉네임:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Container(
                      child: Text("애오니",style: TextStyle(color: Colors.black, height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(1,1),
                          )
                        ],
                      ),
                      width: 250, height: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("아이디:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Container(
                      child: Text("yewon",style: TextStyle(color: Colors.black, height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(1,1),
                          )
                        ],
                      ),
                      width: 250, height: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("비밀번호:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Container(
                      child: Text("**********",style: TextStyle(color: Colors.black, height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(1,1),
                          )
                        ],
                      ),
                      width: 150, height: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("전화번호:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Container(
                      child: Text("010-4607-5793",style: TextStyle(color: Colors.black, height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(1,1),
                          )
                        ],
                      ),
                      width: 150, height: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("생년월일:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Container(
                      child: Text("2002-11-11",style: TextStyle(color: Colors.black, height:1.6,fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(1,1),
                          )
                        ],
                      ),
                      width: 150, height: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                child: ElevatedButton(

                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF788648),fixedSize: Size(100, 30)),
                  child: Text("확인",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

//공지사항 탭
class announcement extends StatelessWidget {
  const announcement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항"),
      ),
      body: Center(
        child: SizedBox(
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF788648),fixedSize: Size(100, 30)),
            child: Text("확인",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}

//개인정보 처리방침 탭
class privacy extends StatelessWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항"),
      ),
      body: Center(
        child:SizedBox(
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF788648),fixedSize: Size(100, 30)),

            child: Text("확인",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
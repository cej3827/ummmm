import 'package:flutter/material.dart';

class idFindPage extends StatefulWidget {
  const idFindPage({Key? key}) : super(key: key);

  @override
  State<idFindPage> createState() => _idFindPageState();
}

class _idFindPageState extends State<idFindPage> with SingleTickerProviderStateMixin{
  late TextEditingController _namecontroller;
  late TextEditingController _PHcontroller;
  late TextEditingController _BDcontroller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _namecontroller = TextEditingController();
    _PHcontroller = TextEditingController();
    _BDcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      appBar: AppBar(
        /*title: Text("아이디/비밀번호 찾기",style: TextStyle(color: Colors.white),),
        centerTitle: true,*/
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))
                /*border:
                  Border(
                    bottom: BorderSide(
                      color: Color(0xFFFFA84E),
                      width: 5,
                    )
                  )*/
              ),
              width: 350,
              height: 50,
              child: TabBar(
                tabs: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('아이디 찾기'),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('비밀번호 찾기'),
                  ),
                ],
                indicatorColor: Color(0xFFFFA84E),
                indicatorWeight: 5,
                labelColor: Colors.black,
                controller: _tabController,
              ),
            ),
            Expanded(
                child: Center(
                  child: Container(
                    width: 350, height: 450,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                            color: Colors.white
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 40,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0, 250, 0),
                                  child: Text("생년월일"),
                                ),
                                SizedBox(
                                  width: 270,height: 40,
                                  child: TextField(
                                    controller: _BDcontroller,
                                    decoration: InputDecoration(
                                      hintText: "생년월일 8자리를 입력해 주세요.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0, 250, 0),
                                  child: Text("휴대폰번호"),
                                ),
                                SizedBox(
                                  width: 270,height: 40,
                                  child: TextField(
                                    controller: _PHcontroller,
                                    decoration: InputDecoration(
                                      hintText: "숫자만 입력해 주세요.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50,),
                                ElevatedButton(
                                    onPressed: (){},
                                    child: Text('확인',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(
                                        0xFF727272),fixedSize: Size(250, 30))
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0, 250, 0),
                                  child: Text("아이디"),
                                ),
                                SizedBox(
                                  width: 270,height: 40,
                                  child: TextField(
                                    controller: _namecontroller,
                                    decoration: InputDecoration(
                                      hintText: "아이디를 입력해 주세요.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0, 250, 0),
                                  child: Text("생년월일"),
                                ),
                                SizedBox(
                                  width: 270,height: 40,
                                  child: TextField(
                                    controller: _BDcontroller,
                                    decoration: InputDecoration(
                                      hintText: "생년월일 8자리를 입력해 주세요.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,0, 250, 0),
                                  child: Text("휴대폰번호"),
                                ),
                                SizedBox(
                                  width: 270,height: 40,
                                  child: TextField(
                                    controller: _PHcontroller,
                                    decoration: InputDecoration(
                                      hintText: "숫자만 입력해 주세요.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                ElevatedButton(
                                    onPressed: (){},
                                    child: Text('확인',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(
                                        0xFF727272),fixedSize: Size(250, 30))
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}


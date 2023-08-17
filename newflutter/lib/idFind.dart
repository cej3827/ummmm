import 'package:flutter/material.dart';

class idFindPage extends StatefulWidget {
  const idFindPage({Key? key}) : super(key: key);

  @override
  State<idFindPage> createState() => _idFindPageState();
}

class _idFindPageState extends State<idFindPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      appBar: AppBar(
        title: Text("아이디/비밀번호 찾기",style: TextStyle(color: Colors.white),),
        centerTitle: true,
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
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 300,
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
                    width: 400, height: 500,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.white
                          ),
                          child: Text('id'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white
                          ),
                          child: Text('pw'),
                        )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}


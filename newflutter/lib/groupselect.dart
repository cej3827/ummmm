import 'package:flutter/material.dart';
import 'package:newflutter/main.dart';

class groupSelect extends StatefulWidget {
  const groupSelect({Key? key}) : super(key: key);

  @override
  State<groupSelect> createState() => _groupSelectState();
}

class _groupSelectState extends State<groupSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF788648),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 320,
              height: 250,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30,),
                  Text("접속할 그룹을 선택하세요.",style: TextStyle(fontSize: 20,color: Colors.black),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130, height: 120,
                        child: IconButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>MyApp())
                              );
                            },
                            icon: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.account_circle,size: 80, color: Color(0xFFFFA84E),),
                                Text("멧돌과 맹구",style: TextStyle(fontSize: 17),),
                              ],
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 130, height: 120,
                        child: IconButton(
                            onPressed: (){},
                            icon: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add_box_outlined,size: 80,color: Color(0xFFFFA84E),),
                                Text("그룹 추가",style: TextStyle(fontSize: 17),)
                              ],
                            )
                        ),
                      ),
                    ],
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

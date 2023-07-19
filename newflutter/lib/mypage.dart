import 'package:flutter/material.dart';

class mypage extends StatelessWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
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
          SizedBox(),
        ],
        ),
      ),
    );
  }
}

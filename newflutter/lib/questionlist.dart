import 'package:flutter/material.dart';

class qlist extends StatelessWidget {
  qlist({Key? key}) : super(key: key);

  var questions = [
    '오늘 뭐 먹었어?',
    '잠온다',
    '집가고싶다',
    '11111',
    '222222',
    '33333',
    '44444',
    '55555',
    '66666'
  ];

  //var answers = ['1', '2', '3', '4', '5','6', '7', '8', '9',];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFEAE7E5)),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          ),
        ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Text('Q ${index}',style: TextStyle(color: Colors.black),),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                Text(questions[index])],
            );
          },
        ),
      ),
    );
  }
}

//질문리스트에서 질문 누르면 답변 나오는 새창 만드는 중..

class answerpopup extends StatelessWidget {
  answerpopup({Key? key}) : super(key: key);

  var questions = [
    '오늘 뭐 먹었어?',
    '잠온다',
    '집가고싶다',
    '11111',
    '222222',
    '33333',
    '44444',
    '55555',
    '66666'
  ];
  var answers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('질문 리스트'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            children: [
              SizedBox(
                height: 30,
                child: Text(
                  (questions[0]),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Text(questions[0]),
              SizedBox(
                child: Row(
                  children: [
                    Icon(Icons.account_circle, size: 40),
                    Text(
                      (answers[0]),
                      style: TextStyle(fontSize: 20),
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

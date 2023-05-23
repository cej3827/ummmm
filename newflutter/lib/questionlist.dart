import 'package:flutter/material.dart';

//DB에 저장된거 받아와야하는데 어케하는지 몰라서 일단 배열..
final questions = [
  'Q1. 오늘 뭐 먹었어?',
  'Q2. 잠온다',
  'Q3. 집가고싶다',
  'Q4.',
  'Q5.',
  'Q6.',
  'Q7.',
  'Q8.',
  'Q9.'
];
final answers = [
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

class qlist extends StatelessWidget {
  const qlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return Card(
          //                           <-- Card widget
          child: ListTile(
            title: Text(questions[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) {
                  return answerpopup0();
                }),
              );
            },
          ),
        );
      },
    );
  }
}

//질문리스트에서 질문 누르면 답변 나오는 새창 만드는 중..

class answerpopup0 extends StatelessWidget {
  const answerpopup0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(questions[0]),
          Text(answers[0],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Contact{
  String title;
  String num;
  //IconData icon;
  Contact(this.title, this.num);
}

class qlist extends StatelessWidget {
  qlist({Key? key}) : super(key: key);

  Widget createSeparator(int position){
    Widget separator = Container(
      height: 10, color: Colors.black,
    );
    return separator;
  }

  List<Contact> buildContacts(){
    List<Contact> contacts = [];
    contacts.add(Contact('오늘 뭐 먹었어?', 'Q1',));
    contacts.add(Contact('오늘의 TMI는?', 'Q2',));
    contacts.add(Contact('니가 잘못했잖아 미친넘아?','Q3',));
    contacts.add(Contact('요즘 빠진 옷은?', 'Q4',));

    return contacts;
  }

  //var answers = ['1', '2', '3', '4', '5','6', '7', '8', '9',];
  @override
  Widget build(BuildContext context) {
    List<ListTile> showContacts(){
      //List colors = [Color(0xFF788648), Color(0xFFFFA84E),];
      List<Contact> contacts = buildContacts();
      for(int i = 0; i<3; i++){
        contacts.addAll(buildContacts());
      }
      List<ListTile> list = [];
      for(var contact in contacts) {
        list.add(ListTile(
          title: Text(contact.title, style: TextStyle(fontSize: 20)),
          //subtitle: Text(contact.subtitle),
          leading: CircleAvatar(radius: 20,backgroundColor: Color(0xFF788648),
              child: Text(contact.num, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
            //backgroundColor: colors[colors.length%2],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => answerpopup()),);
          },
        ));
      }
      return list;
    }
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
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


        child: ListView(children: showContacts(),)
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

import 'package:flutter/material.dart';

class Contact {
  String title;
  String num;
  int indexnum;

  Contact(this.title, this.num, this.indexnum);
}

class qlist extends StatelessWidget {
  qlist({Key? key}) : super(key: key);

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts.add(Contact('오늘 뭐 먹었어?', 'Q1', 1));
    contacts.add(Contact('오늘의 TMI는?', 'Q2', 2));
    contacts.add(Contact('니가 잘못했잖아 미친넘아?', 'Q3', 3));
    contacts.add(Contact('요즘 빠진 옷은?', 'Q4', 4));
    contacts.add(Contact('오늘 꾼 꿈은 뭐야?', 'Q5', 5));

    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> showContacts() {
      List<Contact> contacts = buildContacts();
      for (int i = 1; i < 1; i++) {
        contacts.addAll(buildContacts());
      }
      List<ListTile> list = [];

      for (var contact in contacts) {
        if (contact.indexnum % 2 == 0) {
          list.add(ListTile(
            title: Text(contact.title, style: TextStyle(fontSize: 20)),

            leading: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF788648),
                child: Text(
                  contact.num,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => answerpopup()),
              );
            },
          ));
        } else {
          list.add(ListTile(
            title: Text(contact.title, style: TextStyle(fontSize: 20)),
            //subtitle: Text(contact.subtitle),
            leading: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFFFA84E),
                child: Text(
                  contact.num,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => answerpopup()),
              );
            },
          ));
        }
      }
      return list;
    }

    final sizeX = MediaQuery
        .of(context)
        .size
        .width;
    final sizeY = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      width: sizeX,
      height: sizeY,
      decoration: BoxDecoration(color: Color(0xFFEAE7E5)),
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: ListView(
            children: showContacts(),
          )),
    );
  }
}


class answerpopup extends StatelessWidget {
  answerpopup({Key? key}) : super(key: key);

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts.add(Contact('오늘 뭐 먹었어?', 'Q1', 1));
    contacts.add(Contact('오늘의 TMI는?', 'Q2', 2));
    contacts.add(Contact('니가 잘못했잖아 미친넘아?', 'Q3', 3));
    contacts.add(Contact('요즘 빠진 옷은?', 'Q4', 4));
    contacts.add(Contact('오늘 꾼 꿈은 뭐야?', 'Q5', 5));

    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery
        .of(context)
        .size
        .width;
    final sizeY = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text("질문 리스트"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: sizeX,
        height: sizeY,
        decoration: BoxDecoration(color: Color(0xFFEAE7E5)),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: ListView(
            padding: EdgeInsets.fromLTRB(25, 80, 25, 0),
            children: [
              Container(
              child: ListTile(
                title: (Text(('오늘 뭐 먹었어?'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,))),
                leading: CircleAvatar( radius: 30,
                    backgroundColor: Color(0xFFFFA84E),
                    child: Text(
                      'Q1',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                    )),
              )),
              Container(height: 20),
              Container(
                height: 300,
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                color: Color(0xFFFFD3A5),
                child: ListTile(
                title: Text('오늘 뭐 먹었게?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                  leading: Icon(Icons.account_circle, size: 50, color: Colors.black45,),
                ),


              ),
            ],

          ),
        ),
      ),
    );
  }
}

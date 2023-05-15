import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 70,
        child: TabBar(
          labelColor: Colors.whilt,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs:[
            Tab(icon: Icon(Icons.home,size: 18,)),

          ]
        ),
      ),
    );
  }
}

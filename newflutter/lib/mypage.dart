import 'package:flutter/material.dart';

Map<String, MaterialPageRoute<dynamic>?> routes = {
  'route_screen': null,
  'route_second_screen': null,
};

void addRoute({
  required String screen,
  required Function(MaterialPageRoute route) callback,
}){
  MaterialPageRoute? route;
  switch(screen){
    /*case 'route_screen':
      route = MaterialPageRoute(builder: (context)=>RouteScreen());
      break;*/
    case 'route_second_screen':
      route = MaterialPageRoute(builder: (context)=> const RouteSecondScreen());
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
            SizedBox(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      addRoute(screen: "route_second_screen",
                        callback: (route) => Navigator.push(context,route),
                      );
                    },
                        child: Text("회원정보수정")
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
/*
class RouteScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // 상단바
        title: Text("하냥"),
        centerTitle: true,
        //backgroundColor: Colors.white,
        /*leading: IconButton(
          // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),*/
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              addRoute(screen: "route_second_screen",
                  callback: (route) => Navigator.push(context,route),
              );
            },
            child: Text("d")
            )
          ],
        ),
      ),
    );
  }
}
*/
class RouteSecondScreen extends StatelessWidget {
  const RouteSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RouteSecondScreen"),
      ),
      body: Center(
        child: (Text("k")),
        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                addRoute(
                  screen: "route_third_screen",
                  callback: (route) => Navigator.push(context, route),
                );
              },
              child: const Text("Go third"),
            ),
          ],
        ),*/
      ),
    );
  }
}

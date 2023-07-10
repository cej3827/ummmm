import 'package:flutter/material.dart';

var theme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF57642B),
      unselectedItemColor: Colors.black45,
    ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF57642B),
    elevation: 1,
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23, fontFamily: 'cafe',),
    iconTheme: IconThemeData(color: Colors.white,)
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF788648), // 전체 아이콘 색상
  ),
  fontFamily: 'cafe' // 전체 폰트
);
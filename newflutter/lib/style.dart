import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Color(0xFFD05DFF),
      elevation: 1,
      titleTextStyle: TextStyle(color: Color(0xFFD05DFF), fontWeight: FontWeight.bold, fontSize: 23, fontFamily: 'cafe',),
      iconTheme: IconThemeData(color: Color(0xFFD05DFF),)
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFD05DFF), // 전체 아이콘 색상
    ),
    fontFamily: 'cafe' // 전체 폰트
);
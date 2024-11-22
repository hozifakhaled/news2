import 'package:flutter/material.dart';
class mytheme {
  static final mytheme insatance = mytheme();
  ThemeData light = ThemeData.light().copyWith(
      //textTheme: TextTheme(titleLarge: TextStyle(color:Colors.black,fontSize: 25)),
      cardColor: Colors.white,
   //   backgroundColor: Color(0xffFFF2BC),
  );
  ThemeData dark = ThemeData.dark().copyWith(
    cardColor: Colors.black87,
    //  backgroundColor: Colors.black,
 
       //  textTheme: TextTheme(titleMedium: TextStyle(color:Colors.white,fontSize: 25)),
      );
}

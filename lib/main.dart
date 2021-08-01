import 'package:animal_biography/screens/spash_screen.dart';
import 'package:flutter/material.dart';
import 'helper/db_helper.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Color(0xffC19E82)),
      routes: {
        "/": (context) => SplashScreen(),
      },
    ),
  );
}

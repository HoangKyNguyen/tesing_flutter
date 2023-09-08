import 'package:first_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/first_screen.dart';
import 'package:first_app/pages/second_screen.dart';
import 'package:first_app/pages/list_user.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/list':(context) => const MyApp(),
        '/login':(context)=> const FormLogin(),
      },
    ),
  );
}









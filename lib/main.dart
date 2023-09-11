import 'package:first_app/pages/login.dart';
import 'package:first_app/provider/provider_test.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/first_screen.dart';
import 'package:first_app/pages/second_screen.dart';
import 'package:first_app/pages/list_user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ButtonModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
          '/second': (context) => const SecondScreen(),
          '/list':(context) => const UserList(),
          '/login':(context)=> const FormLogin(),
        },
      ),
    ),
  );
}









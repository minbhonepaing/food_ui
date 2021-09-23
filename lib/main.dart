import 'package:dax_food/pages/darkHome.dart';
import 'package:dax_food/pages/start_page.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      home: StartPage(),
      routes: {
        '/darkhome' : (context) => DarkHomePage(),
      },
    )
  );
}
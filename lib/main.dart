import 'package:flutter/material.dart';
import 'ui/bottom_navigation_widget.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "VibeSix-Flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new BottomNavigationWidget(),
    );
  }
}
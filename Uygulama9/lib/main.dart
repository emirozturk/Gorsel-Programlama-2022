import 'package:flutter/material.dart';
import 'package:flutter_application_1/anasayfa_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapilacaklar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnasayfaWidget(),      
    );
  }
}
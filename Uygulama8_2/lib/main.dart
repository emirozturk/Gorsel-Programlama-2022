import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uygulama_flutter/foto_ekle.dart';
import 'package:uygulama_flutter/login.dart';
import 'package:uygulama_flutter/tab_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uygulama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

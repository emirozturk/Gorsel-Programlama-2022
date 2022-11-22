import 'package:flutter/material.dart';
import 'package:uygulama8/sayfa1.dart';
import 'package:uygulama8/sayfa2.dart';
import 'package:uygulama8/sayfa3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sayfaListesi = [Sayfa1(), Sayfa2(), Sayfa3()];
  var suankiSayfa = 0;
  void sayfaDegistir(index) {
    setState(() {
      suankiSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: sayfaListesi[suankiSayfa],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.usb_rounded), label: "Sayfa2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_individual_suite_sharp),
                label: "Sayfa3"),
          ],
          onTap: (index) => sayfaDegistir(index),
          selectedItemColor: Colors.amber,
          currentIndex: suankiSayfa,
        ),
      ),
    );
  }
}

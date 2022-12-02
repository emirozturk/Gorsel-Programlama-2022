import 'package:flutter/material.dart';
import 'package:flutter_application_1/yapilanlar_widget.dart';
import 'package:flutter_application_1/yapilcaklar_widget.dart';

class AnasayfaWidget extends StatefulWidget {
  @override
  State<AnasayfaWidget> createState() => _AnasayfaWidgetState();
}

class _AnasayfaWidgetState extends State<AnasayfaWidget> {
  var sayfalar = [YapilacaklarWidget(), YapilanlarWidget()];
  var suAnkiSayfa = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDoList"),
      ),
      body: sayfalar[suAnkiSayfa],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            suAnkiSayfa = index;
          });
        },
        currentIndex: suAnkiSayfa,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: "Yapılacaklar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Yapılanlar",
          ),
        ],
      ),
    );
  }
}

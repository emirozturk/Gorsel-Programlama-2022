import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tweets/record.dart';

import 'ekle.dart';
import 'firebase_options.dart';
import 'liste.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
  FirebaseDatabase? database;
  List<Record> kayitlar = [];
  Anasayfa() {
    database = FirebaseDatabase.instance;
  }
}

class _AnasayfaState extends State<Anasayfa> {
  var sayfaIndexi = 0;

  kayitOku(value) async {
    setState(() {});
    sayfaIndexi = value;
    var k = await widget.database!.ref("tweets").get();

    var records = k.children.map((e) {
      var x = e.value as Map<String, dynamic>;
      return Record.fromJson(x);
    }).toList();
    widget.kayitlar = records;
  }

  @override
  Widget build(BuildContext context) {
    var sayfalar = [Liste(widget.kayitlar), Ekle(widget.database)];
    return Scaffold(
      appBar: AppBar(title: const Text("Tweets")),
      body: sayfalar[sayfaIndexi],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Liste"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Ekle"),
        ],
        onTap: kayitOku,
        currentIndex: sayfaIndexi,
      ),
    );
  }
}

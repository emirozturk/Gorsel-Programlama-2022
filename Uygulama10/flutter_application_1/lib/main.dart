import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:flutter_application_1/liste.dart';
import 'package:sqflite/sqflite.dart';

import 'kisi.dart';
import 'liste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Kisi>? liste;
  var idC = TextEditingController();
  var adC = TextEditingController();
  var sozC = TextEditingController();

  void sec(index) {
    idC.text = liste![index].id.toString();
    adC.text = liste![index].ad!;
    sozC.text = liste![index].soz!;
  }

  void listele() async {
    liste = await DbHelper.getAll();
    setState(() {});
  }

  void ekle() {
    DbHelper.ekle(Kisi(int.parse(idC.text), adC.text, sozC.text));
    idC.clear();
    adC.clear();
    sozC.clear();
    setState(() {});
  }

  void guncelle() {
    DbHelper.update(Kisi(int.parse(idC.text), adC.text, sozC.text));
    setState(() {});
  }

  void sil() {
    DbHelper.sil(int.parse(idC.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    listele();
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "id"),
              controller: idC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Ad"),
              controller: adC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Söz"),
              controller: sozC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ekle,
                  child: const Text("Ekle"),
                ),
                ElevatedButton(
                  onPressed: sil,
                  child: const Text("Sil"),
                ),
                ElevatedButton(
                  onPressed: guncelle,
                  child: const Text("Güncelle"),
                ),
              ],
            ),
          ),
          Liste(liste,sec),
        ],
      ),
    );
  }
}

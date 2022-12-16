
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'kayit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ekleController = TextEditingController();
  var araController = TextEditingController();
  var bulunanController = TextEditingController();
  ekle() async {
    var referans = widget.database.ref("kayitlar");
    var kayit = referans.push();
    await kayit.set(Kayit(ekleController.text).toJson());
    ekleController.clear();
  }

  ara() async {
    var liste = [];
    var kayitlar = await widget.database.ref("kayitlar").get();

    for (var k in kayitlar.children) {
        var kayit = k.value as Map<String, dynamic>;
        var yeniKayit = Kayit.fromJson(kayit);
        liste.add(yeniKayit);
        if (yeniKayit.icerik!.contains(araController.text)) {
          bulunanController.text = yeniKayit.icerik!;
        }
      setState(() {});
    }
    liste = kayitlar.children
        .map((k) => Kayit.fromJson(k as Map<String, dynamic>)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: ekleController,
          decoration: InputDecoration(
            hintText: "Ekleme",
          ),
        ),
        ElevatedButton(
          onPressed: ekle,
          child: Text("Ekle"),
        ),
        TextField(
          controller: araController,
          decoration: InputDecoration(
            hintText: "Arama",
          ),
        ),
        ElevatedButton(
          onPressed: ara,
          child: Text("Ara"),
        ),
        TextField(
          controller: bulunanController,
          decoration: InputDecoration(
            hintText: "Bulunan",
          ),
        ),
      ],
    ));
  }
}

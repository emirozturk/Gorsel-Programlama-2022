import 'package:flutter/material.dart';
import 'package:uygulama_flutter/foto_ekle.dart';
import 'package:uygulama_flutter/foto_listesi.dart';

class TabSayfasi extends StatefulWidget {
  @override
  State<TabSayfasi> createState() => _TabSayfasiState();
}

class _TabSayfasiState extends State<TabSayfasi> {
  var sayfalar = [FotoListesi(), FotoEkle()];

  var suAnkiIndex = 0;

  indexDegistir(index) {
    setState(() {
      suAnkiIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uygulama"),
      ),
      body: sayfalar[suAnkiIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: suAnkiIndex,
          onTap: indexDegistir,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Anasayfa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: "Fotoğraf Ekle",
            )
          ]),
    );
  }
}

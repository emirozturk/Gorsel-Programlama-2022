import 'package:flutter/material.dart';
import 'package:uygulama4/liste.dart';
import 'package:uygulama4/veri.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatefulWidget {
  State<AnaUygulama> createState() => AnaUygulamaState();
}

class AnaUygulamaState extends State<AnaUygulama> {
  var kisiListesi = Veri.kisiListesi;
  var index = 0;
  void guncelle(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: ListeWidget(kisiListesi: kisiListesi, guncelle: guncelle),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(kisiListesi[index].adSoyad),
                  Text(kisiListesi[index].burc),
                  Text(kisiListesi[index].telNo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

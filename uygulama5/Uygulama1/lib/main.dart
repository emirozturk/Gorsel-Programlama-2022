import 'package:flutter/material.dart';

import 'caps.dart';
import 'grid.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatefulWidget {
  State<Uygulama> createState() => _UygulamaState();
}

class _UygulamaState extends State<Uygulama> {
  var capsListesi = CapsListe.capsListesi;
  var secilenIndex = -1;
  void indexDegistir(int index) {
    setState(() {
      secilenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: Grid(capsListesi, indexDegistir),
            ),
            Expanded(
              flex: 5,
              child: Image.asset("assets/images/${secilenIndex + 1}.png"),
            ),
          ],
        ),
      ),
    );
  }
}

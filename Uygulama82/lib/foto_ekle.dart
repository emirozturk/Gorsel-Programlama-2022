import 'package:flutter/material.dart';

import 'fotolar.dart';

class FotoEkle extends StatelessWidget {
  var controller = TextEditingController();
  void ekle() {
    var yol = controller.text;
    if (yol.isNotEmpty) {
      Fotolar.liste.add(yol);
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: ekle,
            child: Text("Ekle"),
          ),
        ),
      ]),
    );
  }
}

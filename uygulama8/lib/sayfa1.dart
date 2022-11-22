import 'package:flutter/material.dart';
import 'package:uygulama8/sayfa2.dart';

class Sayfa1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    var controller = TextEditingController();
    void sayfaAc() {
      Navigator.pushNamed(context, "/sayfa2");
    }
  */
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "SAYFA 1",
            style: TextStyle(fontSize: 48),
          ),
          Expanded(
            flex: 10,
            child: TextField(
                //controller: controller,
                ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(onPressed: () {}, child: const Text("İleri")),
          ),
        ],
      ),
    );
  }
}

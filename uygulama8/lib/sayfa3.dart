import 'package:flutter/material.dart';

class Sayfa3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    void geriDon() {
      Navigator.pop(context, controller.text);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Uygulama")),
      body: Column(
        children: [
          Text(
            "SAYFA 3",
            style: TextStyle(fontSize: 48),
          ),
          Expanded(
            flex: 10,
            child: TextField(
              controller: controller,
            ),
          ),
          Expanded(
            flex: 1,
            child:
                ElevatedButton(onPressed: geriDon, child: const Text("Geri")),
          ),
        ],
      ),
    );
  }
}

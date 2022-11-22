import 'package:flutter/material.dart';
import 'package:uygulama8/sayfa3.dart';

class Sayfa2 extends StatelessWidget {
  String? text = "";
  Sayfa2({this.text});
  @override
  Widget build(BuildContext context) {
    /*
    var controller = TextEditingController();
    void sayfaAc() {
      Navigator.pushNamed(context, "/sayfa3", arguments: controller.text);
    }
*/
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulama"),
      ),
      body: Column(
        children: [
          Text(
            text!,
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
            child:
                ElevatedButton(onPressed: (){}, child: const Text("İleri")),
          ),
        ],
      ),
    );
  }
}

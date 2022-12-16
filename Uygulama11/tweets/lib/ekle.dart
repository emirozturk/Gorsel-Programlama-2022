import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweets/record.dart';

class Ekle extends StatefulWidget {
  @override
  State<Ekle> createState() => _EkleState();
  FirebaseDatabase? database;
  Ekle(this.database);
}

class _EkleState extends State<Ekle> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void ekle() async {
      var ref = widget.database!.ref("tweets");
      try {
        var r = ref.push();
        await r.set(Record(controller.text, DateTime.now()).toJson());
        controller.clear();
      } catch (e) {
        print(e.toString());
      }
    }

    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Tweet"),
          controller: controller,
        ),
        ElevatedButton(onPressed: ekle, child: const Text("Ekle")),
      ],
    );
  }
}

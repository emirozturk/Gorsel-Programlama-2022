import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweets/record.dart';

class Liste extends StatefulWidget {
  List<Record> liste = [];
  var listele = [];
  Liste(this.liste) {
    listele = liste;
  }

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  void search(String text) {
    setState(() {});

    if (text.isEmpty) {
      widget.listele = widget.liste;
    } else {
      widget.listele = widget.liste
          .where((element) => element.tweet!.contains(text))
          .toList();
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: search,
        ),
        widget.listele.isEmpty
            ? const Text("Liste")
            : Expanded(
                child: ListView.builder(
                  itemCount: widget.listele.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.listele[index].tweet),
                      subtitle: Text(widget.listele[index].datetime.toString()),
                    );
                  },
                ),
              ),
      ],
    );
  }
}

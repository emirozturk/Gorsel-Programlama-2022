import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Liste extends StatelessWidget {
  var liste;
  var sec;
  Liste(this.liste, this.sec);
  @override
  Widget build(BuildContext context) {
    return liste == null
        ? Text("Liste")
        : SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView.builder(
                itemCount: liste.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(liste[index].ad),
                    subtitle: Text(liste[index].soz),
                    onTap: () => sec(index),
                  );
                }),
          );
  }
}

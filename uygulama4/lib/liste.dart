import 'package:flutter/material.dart';

class ListeWidget extends StatefulWidget {
  var kisiListesi;
  void Function(int) guncelle;
  ListeWidget({super.key, this.kisiListesi, required this.guncelle});
  @override
  State<ListeWidget> createState() => ListeWidgetState();
}

class ListeWidgetState extends State<ListeWidget> {
  var seciliIndex = 0;
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.kisiListesi.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.kisiListesi[index].adSoyad,
          ),
          tileColor: index == seciliIndex ? Colors.blue[500] : Colors.blue[200],
          onTap: () {
            setState(() {
              seciliIndex = index;
              widget.guncelle(seciliIndex);
            });
          },
        );
      },
    );
  }
}

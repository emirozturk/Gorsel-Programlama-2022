import 'dart:io';

import 'package:flutter/material.dart';

class YapilacaklarWidget extends StatefulWidget {
  List<String>? kayitlar;
  List<String> dosyadanOku() {
    var dosya = File("/Users/emirozturk/Desktop/yapilacaklar.txt");
    return dosya.readAsLinesSync();
  }

  YapilacaklarWidget() {
    kayitlar = dosyadanOku();
  }

  @override
  State<YapilacaklarWidget> createState() => _YapilacaklarWidgetState();
}

class _YapilacaklarWidgetState extends State<YapilacaklarWidget> {
  void guncelle(index) {
    setState(() {
      var seciliKayit = widget.kayitlar![index];
      widget.kayitlar!.removeAt(index);
      var dosya = File("/Users/emirozturk/Desktop/yapilacaklar.txt");
      var cikti = "";
      for (int i = 0; i < widget.kayitlar!.length; i++) {
        cikti += widget.kayitlar![i] + "\n";
      }
      dosya.writeAsStringSync(cikti);

      var yapilanlarDosyasi = File("/Users/emirozturk/Desktop/yapilanlar.txt");
      yapilanlarDosyasi.writeAsString(seciliKayit+"\n",mode: FileMode.append);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.kayitlar!.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.kayitlar![index]),
        onTap: () => guncelle(index),
      ),
    );
  }
}

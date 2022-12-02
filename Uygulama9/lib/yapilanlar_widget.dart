import 'dart:io';

import 'package:flutter/material.dart';

class YapilanlarWidget extends StatefulWidget {
  List<String>? kayitlar;
  List<String> dosyadanOku() {
    var dosya = File("/Users/emirozturk/Desktop/yapilanlar.txt");
    return dosya.readAsLinesSync();
  }

  YapilanlarWidget() {
    kayitlar = dosyadanOku();
  }

  @override
  State<YapilanlarWidget> createState() => _YapilanlarWidgetState();
}

class _YapilanlarWidgetState extends State<YapilanlarWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.kayitlar!.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.kayitlar![index]),
        onTap: () {},
      ),
    );
  }
}

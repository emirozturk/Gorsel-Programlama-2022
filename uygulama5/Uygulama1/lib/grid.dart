import 'package:flutter/material.dart';

import 'caps.dart';

class Grid extends StatelessWidget {
  List<Caps> capsListesi;
  var indexDegistir;
  Grid(this.capsListesi,this.indexDegistir);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
      itemCount: capsListesi.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => indexDegistir(index),
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                    "assets/images/${capsListesi[index].dosyaYolu}"),
              ),
              ...capsListesi[index].hashtagler.map((e) => Text(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

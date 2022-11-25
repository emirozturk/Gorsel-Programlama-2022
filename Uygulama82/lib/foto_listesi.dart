import 'dart:io';

import 'package:flutter/material.dart';

import 'fotolar.dart';

class FotoListesi extends StatelessWidget {
  var liste = Fotolar.liste;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
      itemCount: liste.length,
      itemBuilder: ((context, index) => GridTile(
            child: Image.file(
              File(
                liste[index],
              ),
            ),
          )),
    );
  }
}

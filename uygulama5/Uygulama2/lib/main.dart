import 'package:flutter/material.dart';

import 'veri.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatefulWidget {
  @override
  State<Uygulama> createState() => _UygulamaState();
}

class _UygulamaState extends State<Uygulama> {
  var liste = Veri.kisiListesi;
  var adSoyadController = TextEditingController();
  var numaraController = TextEditingController();
  var yasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: adSoyadController,
                      decoration: InputDecoration(
                        hintText: "Ad Soyad",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: yasController,
                      decoration: InputDecoration(
                        hintText: "Yaş",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: numaraController,
                      decoration: InputDecoration(
                        hintText: "Numara",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Ekle"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Ara"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Sil"),
                  ),
                ),
              ],
            ),
            DataTable(
              columns: [
                DataColumn(label: Text("Ad Soyad")),
                DataColumn(label: Text("Yaş")),
                DataColumn(label: Text("Numara")),
              ],
              rows: liste
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.adSoyad)),
                        DataCell(Text(e.yas.toString())),
                        DataCell(Text(e.telNo)),
                      ]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uygulama_flutter/kullanicilar.dart';
import 'package:uygulama_flutter/tab_sayfasi.dart';

class Login extends StatelessWidget {
  var kullanciAdiController = TextEditingController();
  var sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void girisYap() {
      var kullaniciAdi = kullanciAdiController.text;
      var sifre = sifreController.text;
      var liste = Kullanicilar.kullanicilar;
      /*
      for (int i = 0; i < liste.length; i++) {
        if (liste[i].kullaniciAdi == kullaniciAdi && liste[i].sifre == sifre) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TabSayfasi(),
            ),
          );
        }
      }
      */
      var sonuc = liste
          .where((x) => x.kullaniciAdi == kullaniciAdi && x.sifre == sifre);
      if (sonuc.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabSayfasi(),
          ),
        );
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: kullanciAdiController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: sifreController,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: girisYap, child: Text("Giriş")),
          ),
        ],
      ),
    );
  }
}

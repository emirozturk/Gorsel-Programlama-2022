class CapsListe {
  static var capsListesi = [
    Caps("1.png", ["#Comic", "#Linker", "#Runtime"]),
    Caps("2.png", ["#Binary", "#GoodBad"]),
    Caps("3.png", ["#Values", "#definitons"]),
    Caps("4.png", ["#developer", "#backend"]),
    Caps("5.png", ["#software", "#development", "#exam"]),
    Caps("6.png", ["#einstein", "#machine", "#learning"]),
    Caps("7.png", ["#twitter", "#github", "#followers"]),

  ];
}

class Caps {
  String dosyaYolu;
  List<String> hashtagler;
  Caps(this.dosyaYolu, this.hashtagler);
}

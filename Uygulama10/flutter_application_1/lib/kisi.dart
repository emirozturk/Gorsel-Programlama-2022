class Kisi {
  int? id;
  String? ad;
  String? soz;
  Kisi(this.id, this.ad, this.soz);
  Kisi.fromMap(Map<String, dynamic> veri) {
    id = veri["id"];
    ad = veri["ad"];
    soz = veri["soz"];
  }
  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "ad":ad,
      "soz":soz
    };
  }
}
class Kayit {
  String? icerik;
  Kayit(this.icerik);
  Map<String, dynamic> toJson() {
    return {"icerik": icerik};
  }
  Kayit.fromJson(Map<String, dynamic> json) {
    icerik = json["icerik"].toString();
  }
}

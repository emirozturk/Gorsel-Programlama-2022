class Music {
  int? id;
  String? name;
  int? year;
  Music.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    year = json["year"];
  }
  Music(this.name, this.year);
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "year": year};
  }
}

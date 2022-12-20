import 'package:mcfrontend/models/music.dart';

class User {
  int? id;
  String? username;
  String? password;
  List<Music>? musics;
  User({this.id, this.username, this.password, this.musics});

  User.fromJson(Map<String, dynamic> json)
  {      
    id = json['id'];
    username = json['username'];
    password = json['password'];
    musics = (json['musics'] as List<dynamic>)
    .map((e) => Music.fromJson(e as Map<String,dynamic>)).toList();
  } 

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'username': username,
      'password': password,
      'musics': musics,
    };
  }

  void addMusic(Music music) {
    if(musics!=null) {
      musics!.add(music);
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:mcfrontend/models/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:mcfrontend/models/user_similarity.dart';

import '../models/user.dart';

class ApiService {
  static Future<String> Login(String username, String password) async {
    try {
      var url = Uri.parse("${ApiConst.baseURL}/User/Login/");
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          User(id: 0, username: username, password: password, musics: [])
              .toJson(),
        ),
      );
      return response.body;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  static Future<String> AddMusic(User user) async {
    try {
      var url = Uri.parse("${ApiConst.baseURL}/User/${user.id}");
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user.toJson()));
      return response.body;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  static Future<List<UserSimiliarity>> FindSimilarUsers(User user) async {
    try {
      var url = Uri.parse("${ApiConst.baseURL}/Similarity/${user.id}");
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var results = jsonDecode(response.body)["body"];
      List<UserSimiliarity> list = [];
      for (var e in results) {
        var x = UserSimiliarity.fromJson(e);
        list.add(x);
      }
      return Future<List<UserSimiliarity>>(() => list);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

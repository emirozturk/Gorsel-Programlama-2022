import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mcfrontend/screens/main_screen.dart';

import '../models/user.dart';
import '../services/api_service.dart';

class LoginScreen extends StatelessWidget {
  User? loginResult;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: "Kullanıcı Adı")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Şifre"),
                  obscureText: true),
            ),
            ElevatedButton(
              child: const Text("Giriş"),
              onPressed: () {
                ApiService.Login(
                        usernameController.text, passwordController.text)
                    .then(
                  (value) {
                    var result = jsonDecode(value);
                    var body = result["body"];
                    loginResult = User.fromJson(body);
                    if (loginResult != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(loginResult),
                        ),
                      );
                    } else {}
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

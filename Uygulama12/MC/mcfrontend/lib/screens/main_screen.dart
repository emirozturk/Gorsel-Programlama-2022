import 'package:flutter/material.dart';
import 'package:mcfrontend/screens/similarity_screen.dart';
import 'package:mcfrontend/widgets/element_list.dart';
import '../models/music.dart';
import '../models/user.dart';
import "../services/api_service.dart";

class MainScreen extends StatefulWidget {
  User? _user;
  MainScreen(this._user);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final musicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Müzik Listesi")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Container(
                height: MediaQuery.of(context).size.height - 240,
                child: (widget._user!.musics != null)
                    ? ElementList(widget._user!.musics!.map((e) => e.name!).toList())
                    : const Text("Müzik Listesi Boş"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextField(
                controller: musicController,
                decoration: const InputDecoration(hintText: "İsim"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: ElevatedButton(
                  onPressed: () {
                    widget._user!.addMusic(Music(musicController.text,2022));
                    setState(() {
                      ApiService.AddMusic(widget._user!);
                    });
                  },
                  child: const Text("Ekle")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: ElevatedButton(
                  onPressed: () {
                    ApiService.FindSimilarUsers(widget._user!).then(
                      (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SimilarityScreen(value)),
                        );
                      },
                    );
                  },
                  child: const Text("Benzer Ara")),
            ),
          ],
        ));
  }
}

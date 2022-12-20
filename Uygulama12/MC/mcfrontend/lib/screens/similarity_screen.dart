import 'package:flutter/material.dart';
import 'package:mcfrontend/models/user_similarity.dart';
import 'package:mcfrontend/widgets/element_list.dart';
import 'package:mcfrontend/widgets/similarity_list.dart';

class SimilarityScreen extends StatelessWidget {
  void click() {}
  String similarity = "0";
  List<UserSimiliarity> _similarities;
  SimilarityScreen(this._similarities);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Benzerlikler")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Container(
              height: MediaQuery.of(context).size.height - 140,
              child: SimilarityList(_similarities, click),
            ),
          )
        ],
      ),
    );
  }
}

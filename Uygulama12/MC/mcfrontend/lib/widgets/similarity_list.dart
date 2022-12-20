import 'package:flutter/material.dart';
import 'package:mcfrontend/models/user_similarity.dart';

class SimilarityList extends StatelessWidget {
  final List<UserSimiliarity> _elements;
  VoidCallback click;
  SimilarityList(this._elements, this.click, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _elements.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (click),
          title: Card(
            margin: const EdgeInsets.all(5),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    _elements[index].user.username!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    _elements[index].score.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

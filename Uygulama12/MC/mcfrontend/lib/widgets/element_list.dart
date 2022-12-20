import 'package:flutter/material.dart';

class ElementList extends StatelessWidget {
  final List<String> _elements;
  const ElementList(this._elements, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _elements.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (() {
            print("${_elements[index]} Tıklandı");
          }),
          title: Card(
            margin: const EdgeInsets.all(5),
            color: Color.fromARGB(172, 135, 173, 248),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                _elements[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

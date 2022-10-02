import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulama2());
}

class Uygulama2 extends StatelessWidget {
  const Uygulama2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Deneme",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Times New Roman",
                      fontSize: 52,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Text(
                  "Güzel bir denemeydi",
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Sol"),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Sağ"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Link gibi"),
                ),
                IconButton(
                  onPressed: () {
                    print("Clicked");
                  },
                  icon: const Icon(
                    Icons.attribution,
                    color: Colors.blue,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

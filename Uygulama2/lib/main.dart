import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulama());
}

class Uygulama extends StatelessWidget {
  const Uygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Meraba",
              style: TextStyle(
                fontSize: 48,
                color: Colors.purple,
                backgroundColor: Colors.amberAccent,
                fontWeight: FontWeight.w100,
              ),
            ),
            const Text(
              "Güzel bir gün diliyorum",
              style: TextStyle(
                fontSize: 24,
                color: Colors.purpleAccent,
                backgroundColor: Colors.amber,
                fontWeight: FontWeight.w100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.green,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("İptal"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("İleri"),
                  )
                ],
              ),
            ),
            TextButton(
              child: const Text(
                "Link",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                print("Tıklandı2");
              },
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    );
  }
}

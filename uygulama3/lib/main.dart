import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulama());
}

class Uygulama extends StatefulWidget {
  const Uygulama({super.key});

  @override
  State<Uygulama> createState() {
    return _UygulamaState();
  }
}

class _UygulamaState extends State<Uygulama> {
  var degisken = 0;
  void degistir(int deger) {
    setState(() {
      degisken += deger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                degisken.toString(),
                style: const TextStyle(fontSize: 48),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => degistir(1),
                      child: const Text(
                        "Arttır",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      onPressed: () => degistir(-1),
                      child: const Text(
                        "Azalt",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

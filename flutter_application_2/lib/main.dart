import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              spacing: 5,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Willkommen zur App',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Image.network(
                      'https://picsum.photos/seed/picsum/300/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      color: const Color.fromARGB(255, 221, 241, 45),
                      child: Center(
                        child: Text(
                            'Das ist nur ein Beispiel , in dem wir die neue gelernete Widgets umsetzen',
                            textAlign: TextAlign.center),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

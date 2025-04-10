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
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            spacing: 32,
            children: [
              Flexible(
                child: Container(
                  color: Colors.red,
                  height: 200,
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 26, 26, 102),
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

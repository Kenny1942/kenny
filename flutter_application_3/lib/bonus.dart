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
  double currentValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bonus Aufgabe'),
        ),
        body: Column(
          children: [
            Slider(
                value: currentValue,
                min: 1,
                max: 5,
                onChanged: (value) {
                  setState(() {
                    currentValue = value;
                  });
                }),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: currentValue.toInt(),
              child: Container(
                color: const Color.fromARGB(255, 14, 155, 42),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(255, 199, 77, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

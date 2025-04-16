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
  double ee = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 141, 135, 127),
            ),
            Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 34, 25, 158),
            ),
            Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 93, 12, 12),
            ),
            Slider(
                value: ee,
                min: 0,
                max: 5,
                onChanged: (value) {
                  setState(() {
                    ee = value;
                  });
                })
          ],
        ),
      )),
    );
  }
}

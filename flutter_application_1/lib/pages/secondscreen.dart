import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Aufgabe 1'),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Hello App Akademie!',
                style: TextStyle(color: Colors.blue, fontSize: 24),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    child: ElevatedButton(onPressed: () {}, child: Text('A')),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

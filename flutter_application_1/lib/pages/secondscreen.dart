import 'package:flutter/foundation.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 16, 16)),
                      child: ElevatedButton(onPressed: () {}, child: Text('A')),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 33, 243, 117)),
                      child: ElevatedButton(onPressed: () {}, child: Text('B')),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 6, 101, 165)),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('C'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 100,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.face),
                  Icon(Icons.face),
                ],
              ),
            ],
          )),
    );
  }
}

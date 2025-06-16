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
          title: Text('Api Test'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('IP'),
              Text('City: '),
              Text('Timezone: '),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _answer = '';
  String _forced = '';
  String _image = 'https://i.imgur.com/qIufhof.png';
  bool isLoading = false;
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
              FilledButton(
                onPressed: () async {
                  setState(() {
                    isLoading = !isLoading;
                  });

                  final response = await http.get(
                    Uri.parse('https://yesno.wtf/api'),
                  );
                  final Map json = jsonDecode(response.body);
                  await Future.delayed(Duration(seconds: 3));

                  setState(() {
                    isLoading = !isLoading;
                    _answer = json['answer'];
                    _image = json['image'];
                  });
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: const Color.fromARGB(255, 246, 242, 241),
                      )
                    : Text('Load info'),
              ),
              Image.network(
                _image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 50,
              ),
              Text('Hat dir mein Beispiel gefallen??? : ${_answer}'),
            ],
          ),
        ),
      ),
    );
  }
}

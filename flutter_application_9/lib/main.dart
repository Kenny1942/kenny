import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String a = '''{
  "ip": "161.185.160.93",
  "city": "New York City",
  "region": "New York",
  "country": "US",
  "loc": "40.7143,-74.0060",
  "org": "AS22252 The City of New York",
  "postal": "10001",
  "timezone": "America/New_York",
  "readme": "https://ipinfo.io/missingauth"
}''';

    final jsonObject = jsonDecode(a);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [Text('IP: ${jsonObject['ip']}')],
        ),
      ),
    );
  }
}

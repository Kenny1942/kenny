import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/login/presentation/willkommenscreen.dart';

class MainApp extends StatelessWidget {
  final DatabaseRepository db;

  const MainApp(this.db, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: WillkommenScreen(db),
    );
  }
}

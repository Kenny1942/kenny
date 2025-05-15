import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/data/mock_database_repository.dart';
import 'package:flutter_application_9/src/main_app.dart';

void main() {
  final DatabaseRepository db = MockDatabaseRepository();
  runApp(MainApp(db));
}

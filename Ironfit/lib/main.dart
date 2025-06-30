import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/data/mock_database_repository.dart';
import 'package:flutter_application_9/main.dart';
import 'package:flutter_application_9/src/main_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  // final DatabaseRepository db = MockDatabaseRepository();
  // await initializeDateFormatting('de', null); // <- importante
  // runApp(MainApp(db));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

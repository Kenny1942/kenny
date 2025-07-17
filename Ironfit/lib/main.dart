import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/data/firebase_auth_repository.dart';
import 'package:flutter_application_9/src/data/firestore_repository.dart';
import 'package:flutter_application_9/src/main_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //final DatabaseRepository db = MockDatabaseRepository();
  final DatabaseRepository db = FirestoreRepository();
  final AuthRepository auth = FirebaseAuthRepository();
  await initializeDateFormatting('de');
  runApp(MainApp(db, auth));
}

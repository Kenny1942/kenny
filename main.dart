import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/data/firebase_auth_repository.dart';
import 'package:flutter_application_9/src/data/firestore_repository.dart';
import 'package:flutter_application_9/src/main_app.dart';
import 'package:provider/provider.dart';
//import 'package:your_app/repositories/auth_repository.dart';
//import 'package:your_app/repositories/database_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'main_app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting('de');

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => FirestoreRepository(),
        ),
        Provider<AuthRepository>(
          create: (_) => FirebaseAuthRepository(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/home/presentation/mainscreen.dart';
import 'package:flutter_application_9/src/features/login/presentation/anmeldungscreen.dart';
import 'package:flutter_application_9/src/features/login/presentation/registrierung_screen.dart';
import 'package:flutter_application_9/src/features/login/presentation/willkommenscreen.dart';

class MainApp extends StatelessWidget {
  final DatabaseRepository db;
  final AuthRepository auth;

  const MainApp(this.db, this.auth, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          key: Key(snapshot.data?.uid ?? 'no_user'),
          theme: ThemeData(),
          initialRoute: '/',
          routes: {
            '/': (context) => snapshot.hasData
                ? HauptScreen(db, auth)
                : WillkommenScreen(db, auth),
            '/login': (context) => AnmeldungScreen(db, auth),
            '/signup': (context) => RegistrierungScreen(db, auth),
            '/home': (context) => HauptScreen(db, auth),
          },
        );
      },
    );
  }
}

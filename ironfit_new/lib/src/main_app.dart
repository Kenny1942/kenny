import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/home/presentation/mainscreen.dart';
import 'package:flutter_application_9/src/features/login/presentation/anmeldungscreen.dart';
import 'package:flutter_application_9/src/features/login/presentation/registrierung_screen.dart';
import 'package:flutter_application_9/src/features/login/presentation/willkommenscreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final auth = Provider.of<AuthRepository>(context, listen: false);
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          key: Key(snapshot.data?.uid ?? 'no_user'),
          theme: ThemeData(),
          initialRoute: '/',
          routes: {
            '/': (context) =>
                snapshot.hasData ? HauptScreen() : WillkommenScreen(),
            '/login': (context) => AnmeldungScreen(),
            '/signup': (context) => RegistrierungScreen(),
            '/home': (context) => HauptScreen(),
          },
        );
      },
    );
  }
}

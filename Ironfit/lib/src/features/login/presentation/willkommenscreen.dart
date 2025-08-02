import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/login/presentation/anmeldungscreen.dart';
import 'package:flutter_application_9/src/features/login/presentation/registrierung_screen.dart';

class WillkommenScreen extends StatelessWidget {
  final DatabaseRepository db;
  final AuthRepository auth;

  const WillkommenScreen(this.db, this.auth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backg.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 211, 200, 200),
          ),
          Positioned(
            child: Image.asset(
              'assets/images/logo2.png',
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 480),
                Text(
                  'Willkommen bei IronFit',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 15, 1, 1),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Bei uns kannst du dein Training verbessern und',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 15, 1, 1),
                  ),
                ),
                Text(
                  'vieles mehr',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 15, 1, 1),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AnmeldungScreen(db, auth),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 194, 79, 79),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Jetzt anmelden',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  'Schon bei IronFit registriert',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 19, 2, 2),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegistrierungScreen(db, auth),
                      ),
                    );
                  },
                  child: Text(
                    'Hier einloggen',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 1, 1),
                    ),
                  ),
                ),
                SizedBox(height: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

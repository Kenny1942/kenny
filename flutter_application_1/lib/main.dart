import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 241, 243, 239),
          toolbarHeight: 389,

          flexibleSpace: Image.asset(
            'assets/images/logo2.png',
            fit: BoxFit.cover,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text('Willkommen bei Iron Fit',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 1, 1))),
              const SizedBox(height: 10),
              const Text('Bei uns kannst du dein Training verbessern und',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 15, 1, 1))),
              const Text('vieles mehr',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 15, 1, 1))),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(204, 224, 51, 51),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Jetzt anmelden',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 120),
              const Text('Schon bei IronFit registriert',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 19, 2, 2))),
              const SizedBox(height: 10),
              const Text('Hier einloggen',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 1, 1))),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_9/menu_button.dart';

enum MenuView { menu, freunde, training, reminders, berichte }

class Anmeldung extends StatefulWidget {
  const Anmeldung({super.key});

  @override
  State<Anmeldung> createState() => _AnmeldungState();
}

class _AnmeldungState extends State<Anmeldung> {
  @override
  MenuView _currentView = MenuView.menu;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 211, 200, 200).withOpacity(0.9),
          ),
          Positioned.fill(
            left: 0,
            top: -1050,
            child: Image.asset('assets/images/logo5.png'),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                Text(
                  'Hi Kenny!',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuButton(
                      imagePath: 'assets/images/Rectangle1.png',
                      label: 'Freunde',
                      onTap: () {
                        setState(() {
                          _currentView = MenuView.freunde;
                        });
                      },
                    ),
                    MenuButton(
                      imagePath: 'assets/images/Rectangle2.png',
                      label: 'Training',
                      onTap: () {
                        setState(() {
                          _currentView = MenuView.training;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuButton(
                      imagePath: 'assets/images/Rectangle3.png',
                      label: 'Reminders',
                      onTap: () {
                        setState(() {
                          _currentView = MenuView.reminders;
                        });
                      },
                    ),
                    MenuButton(
                      imagePath: 'assets/images/Rectangle4.png',
                      label: 'Berichte',
                      onTap: () {
                        setState(() {
                          _currentView = MenuView.berichte;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

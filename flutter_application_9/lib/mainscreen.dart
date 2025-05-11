import 'package:flutter/material.dart';
import 'package:flutter_application_9/buildmenu.dart';
import 'package:flutter_application_9/freunde.dart';
import 'package:flutter_application_9/training.dart';
import 'package:flutter_application_9/reminders.dart';
import 'package:flutter_application_9/berichte.dart';

enum MenuView { menu, freunde, training, reminders, berichte }

class Anmeldung extends StatefulWidget {
  const Anmeldung({super.key});

  @override
  State<Anmeldung> createState() => _AnmeldungState();
}

class _AnmeldungState extends State<Anmeldung> {
  MenuView _currentView = MenuView.menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //geteilte hintergrund
          Positioned.fill(
            child: Image.asset('assets/images/backg.png', fit: BoxFit.cover),
          ),
          Container(
            color: const Color.fromARGB(255, 211, 200, 200).withOpacity(0.9),
          ),
          Positioned.fill(
            left: 0,
            top: -1050,
            child: Image.asset('assets/images/logo5.png'),
          ),
          Positioned.fill(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentView) {
      case MenuView.freunde:
        return _buildFreunde();
      case MenuView.training:
        return _buildTraining();
      case MenuView.reminders:
        return _buildReminders();
      case MenuView.berichte:
        return _buildBerichte();
      case MenuView.menu:
      default:
        return Buildmenu(
          onMenuSelected: (MenuView selected) {
            setState(() {
              _currentView = selected;
            });
          },
        );
    }
  }

  Widget _buildFreunde() => Freunde(
        back: () {
          setState(() {
            _currentView = MenuView.menu;
          });
        },
        title: 'Freunde',
      );
  Widget _buildTraining() => Training(
        back: () {
          setState(() {
            _currentView = MenuView.menu;
          });
        },
        title: 'Training',
      );
  Widget _buildReminders() => Reminders(
        back: () {
          setState(() {
            _currentView = MenuView.menu;
          });
        },
        title: 'Reminders',
      );
  Widget _buildBerichte() => Berichte(
        back: () {
          setState(() {
            _currentView = MenuView.menu;
          });
        },
        title: 'Berichte',
      );
}

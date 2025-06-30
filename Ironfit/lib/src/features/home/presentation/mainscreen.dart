import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/common/widgets/buildmenu.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/berichte/presentation/berichte.dart';
import 'package:flutter_application_9/src/features/freunde/presentation/freunde.dart';
import 'package:flutter_application_9/src/features/training/presentation/training.dart';
import 'package:flutter_application_9/src/features/reminders/presentation/reminders.dart';

enum MenuView { menu, freunde, training, reminders, berichte }

class HauptScreen extends StatefulWidget {
  final DatabaseRepository db;
  const HauptScreen(this.db, {super.key});

  @override
  State<HauptScreen> createState() => _HauptScreenState();
}

class _HauptScreenState extends State<HauptScreen> {
  MenuView _currentView = MenuView.menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Stack(
        children: [
          //geteilte hintergrund
          Positioned.fill(
            child: Image.asset('assets/images/backg.png', fit: BoxFit.fill),
          ),
          Container(
            color: const Color.fromARGB(255, 211, 200, 200),
          ),
          Positioned(
            left: 0,
            top: -320,
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
  Widget _buildTraining() => Training1(
        widget.db,
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
        widget.db,
        back: () {
          setState(() {
            _currentView = MenuView.menu;
          });
        },
        title: 'Berichte',
      );
}

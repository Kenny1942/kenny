import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/common/widgets/buildmenu.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/berichte/presentation/berichte.dart';
import 'package:flutter_application_9/src/features/freunde/presentation/freunde.dart';
import 'package:flutter_application_9/src/features/home/presentation/profile.dart';
import 'package:flutter_application_9/src/features/login/presentation/willkommenscreen.dart';
import 'package:flutter_application_9/src/features/training/presentation/training.dart';
import 'package:flutter_application_9/src/features/reminders/presentation/reminders.dart';
import 'package:provider/provider.dart';

enum MenuView { menu, freunde, training, reminders, berichte }

class HauptScreen extends StatefulWidget {
  const HauptScreen({super.key});

  @override
  State<HauptScreen> createState() => _HauptScreenState();
}

class _HauptScreenState extends State<HauptScreen> {
  MenuView _currentView = MenuView.menu;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final auth = Provider.of<AuthRepository>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: const Color.fromARGB(255, 152, 11, 23)),
              child: Text('Optionen',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mein Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => WillkommenScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // hintergrund
          Positioned.fill(
            child: Image.asset('assets/images/backg.png', fit: BoxFit.fill),
          ),
          Container(
            color: const Color.fromARGB(255, 211, 200, 200).withOpacity(0.5),
          ),
          // bild oben
          Positioned(
            left: 0,
            top: -320,
            child: Image.asset('assets/images/logo5.png'),
          ),
          // Burger icon
          Positioned(
            left: 10,
            top: 40,
            child: IconButton(
              icon: Icon(Icons.menu, size: 30, color: Colors.black),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/common/widgets/menu_button.dart';
import 'package:flutter_application_9/src/features/home/presentation/mainscreen.dart';
import 'package:flutter_application_9/src/features/home/presentation/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Buildmenu extends StatefulWidget {
  final Function(MenuView) onMenuSelected;

  const Buildmenu({super.key, required this.onMenuSelected});

  @override
  State<Buildmenu> createState() => BuildmenuState();
}

class BuildmenuState extends State<Buildmenu> {
  String _userName = "";

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? "";
    });
  }

  void updateUserName(String name) {
    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 170),
          Text(
            _userName.isNotEmpty ? 'Hi $_userName' : 'Hi',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 40),
          const Text('Menu', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButton(
                imagePath: 'assets/images/Rectangle1.png',
                label: 'Freunde',
                onTap: () => widget.onMenuSelected(MenuView.freunde),
              ),
              MenuButton(
                imagePath: 'assets/images/Rectangle2.png',
                label: 'Training',
                onTap: () => widget.onMenuSelected(MenuView.training),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButton(
                imagePath: 'assets/images/Rectangle3.png',
                label: 'Reminders',
                onTap: () => widget.onMenuSelected(MenuView.reminders),
              ),
              MenuButton(
                imagePath: 'assets/images/Rectangle4.png',
                label: 'Berichte',
                onTap: () => widget.onMenuSelected(MenuView.berichte),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

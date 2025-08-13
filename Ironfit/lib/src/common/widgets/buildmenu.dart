import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/common/widgets/menu_button.dart';
import 'package:flutter_application_9/src/features/home/presentation/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Buildmenu extends StatelessWidget {
  final Function(MenuView) onMenuSelected;

  const Buildmenu({super.key, required this.onMenuSelected});

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 170),
          FutureBuilder<String>(
            future: _getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Hi', style: TextStyle(fontSize: 24));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Text('Hi ${snapshot.data}',
                    style: TextStyle(fontSize: 24));
              } else {
                return Text('Hi', style: TextStyle(fontSize: 24));
              }
            },
          ),
          SizedBox(height: 40),
          Text('Menu', style: TextStyle(fontSize: 20)),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButton(
                imagePath: 'assets/images/Rectangle1.png',
                label: 'Freunde',
                onTap: () => onMenuSelected(MenuView.freunde),
              ),
              MenuButton(
                imagePath: 'assets/images/Rectangle2.png',
                label: 'Training',
                onTap: () => onMenuSelected(MenuView.training),
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
                onTap: () => onMenuSelected(MenuView.reminders),
              ),
              MenuButton(
                imagePath: 'assets/images/Rectangle4.png',
                label: 'Berichte',
                onTap: () => onMenuSelected(MenuView.berichte),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

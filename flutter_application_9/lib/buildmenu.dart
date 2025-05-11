import 'package:flutter/material.dart';
import 'package:flutter_application_9/menu_button.dart';
import 'package:flutter_application_9/mainscreen.dart';

class Buildmenu extends StatelessWidget {
  final Function(MenuView) onMenuSelected;

  const Buildmenu({super.key, required this.onMenuSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 170),
          Text('Hi Kenny!', style: TextStyle(fontSize: 24)),
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

import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 22, 8, 8)
                  .withAlpha((0.3 * 255).round()),
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.07688,
                shadows: [
                  Shadow(
                    offset: Offset(-1, -1),
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(1, -1),
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(-1, 1),
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(1, 1),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

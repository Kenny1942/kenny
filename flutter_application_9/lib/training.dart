import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  final String title;
  final VoidCallback back;

  const Training({
    super.key,
    required this.title,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: back,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

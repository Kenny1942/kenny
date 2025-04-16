import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String imagePath;

  const ImageDetailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

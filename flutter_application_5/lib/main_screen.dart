import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 12, 20),
        title: Text('MyGallery', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
      ]),
    );
  }
}

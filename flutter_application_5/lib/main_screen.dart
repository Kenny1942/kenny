import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/about_me_page.dart';
import 'package:flutter_application_5/pages/image_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  List<Widget> pages = [
    ImagePage(),
    AboutMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 12, 20),
        title: Text('MyGallery', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: pages[_pageIndex],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _pageIndex,
          onDestinationSelected: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
          ]),
    );
  }
}

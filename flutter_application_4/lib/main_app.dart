import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  int pageIndex = 0;
  List<Widget> pages = [
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hallo')),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    children: [
                      Text('Kenny'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                    ),
                    Divider(
                      height: 50,
                    ),
                    ListTile(
                      onTap: () {
                        print("Logout wurde geklickt!");
                      },
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [Text(' MENU'), Expanded(child: pages[pageIndex])],
        ),
      ),
    );
    //       ],
    //     ),
    //   ),
    // );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: const Color.fromARGB(255, 191, 187, 218),
        child: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: const Color.fromARGB(255, 229, 255, 0),
        child: Center(
          child: Text("Settings Page"),
        ),
      ),
    );
  }
}

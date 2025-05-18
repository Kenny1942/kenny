import 'package:flutter/material.dart';
import 'package:flutter_application_11/page2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('Hello Akademie'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Page2(),
                ));
              },
              child: Text('go to next page'),
            ),
            SizedBox(height: 500),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.star, color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.circle, color: Colors.red),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.blue),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.square, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}

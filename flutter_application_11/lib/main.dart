import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SampleExamScreen(),
    );
  }
}

class SampleExamScreen extends StatefulWidget {
  const SampleExamScreen({super.key});

  @override
  State<SampleExamScreen> createState() => _SampleExamScreenState();
}

class _SampleExamScreenState extends State<SampleExamScreen> {
  @override
  bool x = false;
  bool x1 = false;
  bool e = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Probe-Wissenchecks'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              height: 250,
              width: 250,
              'assets/images/moon.png',
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text('Vorbereitung'),
              subtitle: Text('Auf dem Wissenchek 4'),
              leading:
                  Icon(x ? Icons.check_box : Icons.check_box_outline_blank),
              onTap: () {
                setState(() {
                  x = !x;
                });
              },
            ),
            ListTile(
              title: Text('Durchführung'),
              subtitle: Text('Des Wissenchek 4'),
              leading:
                  Icon(x1 ? Icons.check_box : Icons.check_box_outline_blank),
              onTap: () {
                setState(() {
                  x1 = !x1;
                });
              },
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment:
                    e ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.heart_broken,
                      color: Colors.red,
                      size: 80,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 80,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  e = !e;
                });
              },
              child: Text('Swap'),
            ),
          ],
        ),
      ),
    );
  }
}

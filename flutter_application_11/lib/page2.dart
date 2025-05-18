import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('Selected colors'),
            SizedBox(
              height: 50,
            ),
            Container(height: 50, width: 50, color: Colors.green),
            Container(height: 50, width: 50, color: Colors.red),
            Container(height: 50, width: 50, color: Colors.blue),
            Container(height: 50, width: 50, color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}

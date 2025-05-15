import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

class Berichte extends StatefulWidget {
  final DatabaseRepository db;
  final String title;
  final VoidCallback back;

  const Berichte(
    this.db, {
    super.key,
    required this.title,
    required this.back,
  });

  @override
  State<Berichte> createState() => _FreundeState();
}

class _FreundeState extends State<Berichte> {
  @override
  Widget build(BuildContext context) {
    List<Training> myTrainings = widget.db.getUserTrainings('user1');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: widget.back,
          ),
          Text('Zusammenfassung der letzen 7 Tagen'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Datum:${myTrainings[0].date}',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
          Text('Training:${myTrainings[0].type}'),
          Text('Zeit:${myTrainings[0].duration}'),
          Text('Kalorien:${myTrainings[0].caloriesBurned}'),
          SizedBox(
            height: 10,
          ),
          Text('Datum:${myTrainings[1].date}',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
          Text('Training:${myTrainings[1].type}'),
          Text('Zeit:${myTrainings[1].duration}'),
          Text('Kalorien:${myTrainings[1].caloriesBurned}'),
        ],
      ),
    );
  }
}

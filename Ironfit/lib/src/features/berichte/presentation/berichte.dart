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
  late Future<List<Training>> training;
  @override
  void initState() {
    training = widget.db.getUserTrainings('user1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Text(
          'Zusammenfassung',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: FutureBuilder(
            future: training,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              final trainings = snapshot.data!;
              if (trainings.isEmpty) {
                return Center(child: Text('Keine Trainings'));
              }
              return ListView.builder(
                itemCount: trainings.length,
                itemBuilder: (context, index) {
                  final t = trainings[index];
                  return ListTile(
                    title: Text(t.type.toString()),
                    subtitle: Text(t.date.toLocal().toString()),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

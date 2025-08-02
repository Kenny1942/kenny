import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';
import 'package:provider/provider.dart';

class Berichte extends StatefulWidget {
  final String title;
  final VoidCallback back;

  const Berichte({
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
    final db = Provider.of<DatabaseRepository>(context, listen: false);

    training = db.getUserTrainings('user2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
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
              padding: const EdgeInsets.only(top: 200.0),
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
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.back,
            ),
          ),
        ),
        Positioned(
            top: 150,
            left: 150,
            child: Text(widget.title, style: const TextStyle(fontSize: 24))),
      ],
    );
  }
}

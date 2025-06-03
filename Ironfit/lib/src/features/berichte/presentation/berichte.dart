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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: training,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Training>? training = snapshot.data ?? [];
                return Column(children: [
                  SizedBox(
                    height: 130,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: widget.back,
                    ),
                  ),
                  Text(widget.title, style: const TextStyle(fontSize: 24)),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Zusammenfassung der letzen 7 Tagen'),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Datum:${training[0].date}',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                  ),
                  Text('Training:${training[0].type}'),
                  Text('Zeit:${training[0].duration}'),
                  Text('Kalorien:${training[0].caloriesBurned}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Datum:${training[1].date}',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
                  Text('Training:${training[1].type}'),
                  Text('Zeit:${training[1].duration}'),
                  Text('Kalorien:${training[1].caloriesBurned}'),
                  SizedBox(height: 50),
                ]);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
            }

            return CircularProgressIndicator();
            // ListView.builder(
            //   itemCount: training.length,
            //   itemBuilder: (context, index) {
            //     final training = training[index];

            // return Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       training.notes,
            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //     ),
            //     Text('Tipo: ${training.type.name}'),
            //     Text('Duración: ${training.duration.inMinutes} minutos'),
            //     Text('Calorías: ${training.caloriesBurned} kcal'),
            //     SizedBox(height: 12), // space
            //   ],
            // );
            // },
            // ),
          }),
    );
  }
}

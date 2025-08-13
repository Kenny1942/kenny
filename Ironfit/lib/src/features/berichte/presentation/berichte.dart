import 'package:firebase_auth/firebase_auth.dart';
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
  State<Berichte> createState() => _BerichteState();
}

class _BerichteState extends State<Berichte> {
  String _formatTrainingType(TrainingType type) {
    switch (type) {
      case TrainingType.running:
        return 'Laufen';
      case TrainingType.cycling:
        return 'Radfahren';
      case TrainingType.swimming:
        return 'Schwimmen';
      case TrainingType.weightlifting:
        return 'Gewichtheben';
      case TrainingType.yoga:
        return 'Yoga';
      case TrainingType.other:
        return 'Andere';
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  late Future<List<Training>> training;

  @override
  void initState() {
    super.initState();
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final uid = FirebaseAuth.instance.currentUser!.uid;
    training = db.getUserTrainings(uid);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Training>>(
      future: training,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final trainings = snapshot.data ?? [];
        if (trainings.isEmpty) {
          return const Center(child: Text('Keine Trainings'));
        }

        return Column(
          children: [
            // Barra superior con botón atrás y título
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top:
                      90.0, // 🔹 aquí lo bajas, ajusta este valor hasta que encaje
                  left: 8.0,
                  right: 8.0,
                  bottom: 12.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: widget.back,
                    ),
                    const SizedBox(width: 86),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Lista desplazable dejando un espacio reducido arriba
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 5), // reducido para empezar más arriba
                child: ListView.builder(
                  itemCount: trainings.length,
                  itemBuilder: (context, index) {
                    final t = trainings[index];
                    final trainingType = _formatTrainingType(t.type);
                    final formattedDate = _formatDate(t.date);
                    final formattedDuration = _formatDuration(t.duration);
                    final calories =
                        "${t.caloriesBurned.toStringAsFixed(0)} kcal";

                    return Card(
                      color: const Color.fromARGB(255, 193, 205, 133),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.fitness_center),
                        title: Text(trainingType,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dauer: $formattedDuration min"),
                            Text("Datum: $formattedDate"),
                            Text("Kalorien: $calories"),
                            if (t.notes.isNotEmpty) Text("Notes: ${t.notes}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

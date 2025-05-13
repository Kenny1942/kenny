import 'package:flutter/material.dart';

class Berichte extends StatelessWidget {
  final List<Map<String, dynamic>> trainings;
  final String title;
  final VoidCallback back;

  const Berichte(
      {super.key,
      required this.trainings,
      required this.title,
      required this.back});

  @override
  Widget build(BuildContext context) {
    final totalDauer = trainings.fold<int>(
        0, (sum, item) => sum + ((item['dauer'] ?? 0) as num).toInt());
    final totalDistanz = trainings.fold<double>(
        0.0, (sum, item) => sum + (item['distanz'] ?? 0.0));
    final totalKalorien = trainings.fold<double>(
        0.0, (sum, item) => sum + (item['kalorien'] ?? 0.0));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Berichte',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text('Trainingsanzahl: ${trainings.length}'),
          Text('Zeit insgesamt: $totalDauer min'),
          Text('Distanz insgesamt: ${totalDistanz.toStringAsFixed(2)} km'),
          Text('Kalorien: ${totalKalorien.toStringAsFixed(0)} kcal'),
        ],
      ),
    );
  }
}

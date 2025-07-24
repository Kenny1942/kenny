import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrainingForm extends StatefulWidget {
  final String name;

  const TrainingForm({super.key, required this.name});

  @override
  State<TrainingForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<TrainingForm> {
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _dauerController = TextEditingController();
  final TextEditingController _distanzController = TextEditingController();

  double _kalorien = 0;
  DateTime _selectedDate = DateTime.now();

  void _kalorienBerechnung() {
    final dauer = double.tryParse(_dauerController.text) ?? 0;
    final distanz = double.tryParse(_distanzController.text) ?? 0;

    setState(() {
      _kalorien = (dauer * 5) + (distanz * 10); // Kalorienberechnung
    });
  }

  TrainingType _parseTrainingType(String name) {
    switch (name) {
      case 'Joggen':
        return TrainingType.running;
      case 'Schwimmen':
        return TrainingType.swimming;
      case 'Gehen':
        return TrainingType.yoga;
      case 'Workout':
        return TrainingType.weightlifting;
      case 'Radfahren':
        return TrainingType.cycling;
      default:
        return TrainingType.other;
    }
  }

  @override
  void dispose() {
    _dauerController.dispose();
    _distanzController.dispose();

    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Details: ${widget.name}'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(const Duration(days: 700)),
                  lastDate: DateTime.now().add(Duration(days: 1)),
                );
                if (newDate != null) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                }
              },
              child: Text(
                  "Wähle Datum aus: ${DateFormat.yMMMEd('de').format(_selectedDate)}"),
            ),
            TextField(
              controller: _dauerController,
              decoration: const InputDecoration(labelText: 'Dauer (Min)'),
            ),
            TextField(
              controller: _distanzController,
              decoration: const InputDecoration(labelText: 'Distanz (km)'),
              keyboardType: TextInputType.number,
              onChanged: (_) => _kalorienBerechnung(),
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              keyboardType: TextInputType.number,
              onChanged: (_) => _kalorienBerechnung(),
            ),
            const SizedBox(height: 12),
            Text('Kalorien: $_kalorien', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Training t = Training(
              date: _selectedDate,
              duration: Duration(minutes: int.parse(_dauerController.text)),
              userId: "user2",
              id: "3",
              type: _parseTrainingType(widget.name),
              caloriesBurned: _kalorien,
              notes: _notesController.text,
            );
            final db = Provider.of<DatabaseRepository>(context, listen: false);

            db.addTraining(t);

            Navigator.pop(context);
          },
          child: const Text('Speichern'),
        ),
      ],
    );
  }
}

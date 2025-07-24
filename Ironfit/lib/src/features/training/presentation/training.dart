import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/features/training/presentation/trainingsformular.dart';

class Training1 extends StatefulWidget {
  final String title;
  final VoidCallback back;

  const Training1({super.key, required this.title, required this.back});

  @override
  State<Training1> createState() => _TrainingState();
}

class _TrainingState extends State<Training1> {
  void _formOpen(String exercise) {
    showDialog(
      context: context,
      builder: (context) => TrainingForm(name: exercise),
    );
  }

  Widget _trainingButton(String name, IconData icon) {
    return InkWell(
      onTap: () => _formOpen(name),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(icon,
                size: 32, color: const Color.fromARGB(255, 255, 255, 255)),
            const SizedBox(width: 16),
            Text(name,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 232, 237, 230))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // zurückbutton
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
            child: Text('Training', style: const TextStyle(fontSize: 24))),
        Padding(
          padding: const EdgeInsets.only(top: 260, left: 45, right: 45),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 103, 13, 5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Was möchten Sie eintragen?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Divider(),
                _trainingButton('Joggen', Icons.directions_run),
                _trainingButton('Schwimmen', Icons.pool),
                _trainingButton('Gehen', Icons.directions_walk),
                _trainingButton('Workout', Icons.fitness_center),
                _trainingButton('Radfahren', Icons.bike_scooter),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TrainingForm extends StatefulWidget {
  final String nombre;

  const TrainingForm({required this.nombre});

  @override
  State<TrainingForm> createState() => _FormularioEjercicioState();
}

class _FormularioEjercicioState extends State<TrainingForm> {
  final TextEditingController _datumController = TextEditingController();
  final TextEditingController _beginnController = TextEditingController();
  final TextEditingController _dauerController = TextEditingController();
  final TextEditingController _distanzController = TextEditingController();

  double _kalorien = 0;

  void _kalorienBerechnung() {
    final dauer = double.tryParse(_dauerController.text) ?? 0;
    final distanz = double.tryParse(_distanzController.text) ?? 0;

    setState(() {
      _kalorien = (dauer * 5) + (distanz * 10); // Kalorienberechnung
    });
  }

  @override
  void dispose() {
    _datumController.dispose();
    _beginnController.dispose();
    _dauerController.dispose();
    _distanzController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Details: ${widget.nombre}'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _datumController,
              decoration: const InputDecoration(labelText: 'Datum'),
            ),
            TextField(
              controller: _beginnController,
              decoration: const InputDecoration(labelText: 'Beginn'),
            ),
            TextField(
              controller: _dauerController,
              decoration: const InputDecoration(labelText: 'Dauer (min)'),
              keyboardType: TextInputType.number,
              onChanged: (_) => _kalorienBerechnung(),
            ),
            TextField(
              controller: _distanzController,
              decoration: const InputDecoration(labelText: 'Distanz (km)'),
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
          onPressed: () => Navigator.pop(context),
          child: const Text('Speichern'),
        ),
      ],
    );
  }
}

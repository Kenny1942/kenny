import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reminders extends StatefulWidget {
  final String title;
  final VoidCallback back;

  const Reminders({
    super.key,
    required this.title,
    required this.back,
  });

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  void initState() {
    super.initState();
    _loadRemindersFromFirestore();
  }

  void _loadRemindersFromFirestore() async {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final reminders = await db.loadReminders(userId);
    setState(() {
      _reminders.addAll(reminders);
    });
  }

  final List<Map<String, dynamic>> _reminders = [];

  void _addReminder() {
    TimeOfDay selectedTime = TimeOfDay.now();

    showTimePicker(
      context: context,
      initialTime: selectedTime,
    ).then((time) {
      if (time != null) {
        setState(() {
          _reminders.add({
            'time': time,
            'active': true,
            'days': {
              'Mo': false,
              'Di': false,
              'Mi': false,
              'Do': false,
              'Fr': false,
              'Sa': false,
              'So': false,
            },
          });
        });
        _saveRemindersToFirestore();
      }
    });
  }

  void _saveRemindersToFirestore() {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    db.saveReminders(userId, _reminders);
  }

  void _deleteReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
    _saveRemindersToFirestore();
  }

  void _toggleActive(int index, bool value) {
    setState(() {
      _reminders[index]['active'] = value;
    });
    _saveRemindersToFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // zuruück button
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.back,
            ),
          ),
        ),

        // reminders list
        Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Column(
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _reminders.length,
                  itemBuilder: (context, index) {
                    final reminder = _reminders[index];
                    final hora = reminder['time'] as TimeOfDay;
                    return Card(
                      color: const Color.fromARGB(255, 119, 103, 80),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      hora.format(context),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Checkbox(
                                      value: reminder['active'],
                                      onChanged: (value) =>
                                          _toggleActive(index, value!),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteReminder(index),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: (reminder['days'] as Map<String, bool>)
                                  .entries
                                  .map((entry) {
                                return FilterChip(
                                    label: Text(entry.key),
                                    selected: entry.value,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        reminder['days'][entry.key] = selected;
                                      });
                                      _saveRemindersToFirestore();
                                    });
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // flotating button to add more friends
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _addReminder,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

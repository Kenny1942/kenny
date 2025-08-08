import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  String id;
  String userId;
  String title;
  String description;
  List<String> daysOfWeek; // ["Monday", "Wednesday"]
  DateTime time;
  bool enabled;

  Reminder({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.daysOfWeek,
    required this.time,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'daysOfWeek': daysOfWeek,
      'time': time,
      'enabled': enabled,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      daysOfWeek: List<String>.from(map['daysOfWeek'] ?? []),
      time: (map['time'] as Timestamp).toDate(),
      enabled: map['enabled'] ?? true,
    );
  }
}

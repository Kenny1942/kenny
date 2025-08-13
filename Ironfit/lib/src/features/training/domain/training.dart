import 'package:cloud_firestore/cloud_firestore.dart';

enum TrainingType { running, swimming, cycling, weightlifting, yoga, other }

class Training {
  String id;
  String userId;
  TrainingType type;
  DateTime date;
  Duration duration;
  double caloriesBurned;
  String notes;

  Training({
    required this.id,
    required this.userId,
    required this.type,
    required this.date,
    required this.duration,
    required this.caloriesBurned,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'type': type.name,
      'date': date,
      'duration': duration.inMinutes,
      'caloriesBurned': caloriesBurned,
      'notes': notes,
    };
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      id:   map['id'] ?? '',
      userId: map['userId'] ?? '',
      type: TrainingType.values.byName(map['type']),
      date: (map['date'] as Timestamp).toDate(),
      duration: Duration(seconds: map['duration']),
      caloriesBurned: (map['caloriesBurned'] as num).toDouble(),  
      notes: map['notes'] ?? '',
    );
  }
}

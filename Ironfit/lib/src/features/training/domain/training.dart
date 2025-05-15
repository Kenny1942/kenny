enum TrainingType { running, swimming, cycling, weightlifting, yoga, other }

class Training {
  final String id;
  final String userId;
  final TrainingType type;
  final DateTime date;
  final Duration duration;
  final double caloriesBurned;
  final String notes;

  Training({
    required this.id,
    required this.userId,
    required this.type,
    required this.date,
    required this.duration,
    required this.caloriesBurned,
    required this.notes,
  });
}

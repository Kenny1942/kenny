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
  }

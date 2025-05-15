enum Gender { male, female, other }

class UserProfile {
  final String id;
  final String userId;
  final String name;
  final DateTime dateOfBirth;
  final double weight;
  final double height;
  final Gender gender;

  UserProfile({
    required this.id,
    required this.userId,
    required this.name,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.gender,
  });
}

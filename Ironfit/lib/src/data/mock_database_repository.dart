import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

class MockDatabaseRepository implements DatabaseRepository {
  // Simulated database
  final List<UserProfile> _profiles = [
    UserProfile(
      id: "1",
      userId: "user1",
      name: "John Doe",
      dateOfBirth: DateTime(1990, 5, 20),
      weight: 75.5,
      height: 180.0,
      gender: Gender.male,
    ),
    UserProfile(
      id: "2",
      userId: "user2",
      name: "Jane Smith",
      dateOfBirth: DateTime(1995, 8, 15),
      weight: 62.0,
      height: 165.0,
      gender: Gender.female,
    ),
  ];

  // ddkdkdkdkdkdkddkkddkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkddkdkdkd
  final List<Training> _trainings = [
    Training(
      id: "1",
      userId: "user1",
      type: TrainingType.running,
      date: DateTime.now().subtract(const Duration(days: 5)),
      duration: Duration(hours: 1, minutes: 30),
      caloriesBurned: 350.0,
      notes: "Evening run in the park",
    ),
    Training(
      id: "2",
      userId: "user1",
      type: TrainingType.weightlifting,
      date: DateTime.now().subtract(const Duration(days: 4)),
      duration: Duration(hours: 1, minutes: 0),
      caloriesBurned: 420.0,
      notes: "Leg day",
    ),
    Training(
      id: "3",
      userId: "user2",
      type: TrainingType.yoga,
      date: DateTime.now().subtract(const Duration(days: 3)),
      duration: Duration(hours: 1, minutes: 15),
      caloriesBurned: 280.0,
      notes: "Morning yoga session",
    ),
  ];

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      return _profiles.firstWhere((profile) => profile.userId == userId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> createUserProfile(UserProfile profile) async {
    await Future.delayed(Duration(seconds: 3));
    _profiles.add(profile);
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) async {
    await Future.delayed(Duration(seconds: 3));
    final index = _profiles.indexWhere((p) => p.id == profile.id);
    if (index != -1) {
      _profiles[index] = profile;
    }
  }

  @override
  Future<List<Training>> getUserTrainings(String userId) async {
    await Future.delayed(Duration(seconds: 3));
    return _trainings.where((training) => training.userId == userId).toList();
  }

  @override
  Future<void> addTraining(Training training) async {
    await Future.delayed(Duration(seconds: 3));
    _trainings.add(training);
  }
}

import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

abstract class DatabaseRepository {
  // on sign in
  Future<UserProfile?> getUserProfile(String userId);
  // on sign up
  Future<void> createUserProfile(UserProfile profile);
  // on change profile
  Future<void> updateUserProfile(UserProfile profile);

  // Training
  Future<List<Training>> getUserTrainings(String userId);
  Future<void> addTraining(Training training);
}

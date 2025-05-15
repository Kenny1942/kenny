import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

abstract class DatabaseRepository {
  // on sign in
  UserProfile? getUserProfile(String userId);
  // on sign up
  void createUserProfile(UserProfile profile);
  // on change profile
  void updateUserProfile(UserProfile profile);

  // Training
  List<Training> getUserTrainings(String userId);
  void addTraining(Training training);
}

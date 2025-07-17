import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

class FirestoreRepository implements DatabaseRepository {
  final fs = FirebaseFirestore.instance;

  @override
  Future<List<Training>> getUserTrainings(String trainingId) async {
    final snaps = await fs.collection('trainings').get();
    return snaps.docs.map((e) {
      return Training.fromMap(e.data());
    }).toList();
  }

  @override
  Future<void> addTraining(Training training) async {
    await fs.collection('trainings').doc(training.id).set(training.toMap());
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    final doc = await fs.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data()!);
    } else {
      return null;
    }
  }

  @override
  Future<void> createUserProfile(UserProfile profile) async {
    await fs.collection('users').doc(profile.userId).set(profile.toMap());
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) async {
    await fs.collection('users').doc(profile.userId).update(profile.toMap());
  }
}

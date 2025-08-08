import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:flutter_application_9/src/features/training/domain/training.dart';

class FirestoreRepository implements DatabaseRepository {
  final fs = FirebaseFirestore.instance;

  @override
  Future<List<Training>> getUserTrainings(String userId) async {
    final snaps = await fs
        .collection('trainings')
        .where('userId', isEqualTo: userId)
        .get();

    return snaps.docs.map((e) {
      return Training.fromMap(e.data());
    }).toList();
  }

  @override
  Future<void> addTraining(Training training) async {
    await fs.collection('trainings').doc(training.id).set({
      ...training.toMap(),
      'userId': training.userId, // Asegurate de incluir esto en el modelo
    });
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
    await fs
        .collection('users')
        .doc(profile.userId)
        .set(profile.toMap(), SetOptions(merge: true));
  }

  Future<void> saveReminders(
      String userId, List<Map<String, dynamic>> reminders) async {
    await fs.collection('users').doc(userId).update({
      'reminders': reminders
          .map((r) => {
                'time': '${r['time'].hour}:${r['time'].minute}',
                'active': r['active'],
                'days': r['days'],
              })
          .toList(),
    });
  }

  //vorgeschlagene Methode zum Speichern von Erinnerungen
  Future<List<Map<String, dynamic>>> getReminders(String userId) async {
    final doc = await fs.collection('users').doc(userId).get();
    if (doc.exists && doc.data()!.containsKey('reminders')) {
      return List<Map<String, dynamic>>.from(doc.data()!['reminders']);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> loadReminders(String userId) async {
    final doc = await fs.collection('users').doc(userId).get();
    if (!doc.exists || doc.data()?['reminders'] == null) return [];

    final List reminders = doc.data()!['reminders'];
    return reminders.map<Map<String, dynamic>>((r) {
      final timeParts = (r['time'] as String).split(':');
      return {
        'time': TimeOfDay(
            hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1])),
        'active': r['active'],
        'days': Map<String, bool>.from(r['days']),
      };
    }).toList();
  }
}

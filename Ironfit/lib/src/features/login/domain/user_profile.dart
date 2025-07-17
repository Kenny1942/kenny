import 'package:cloud_firestore/cloud_firestore.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'weight': weight,
      'height': height,
      'gender': gender.name,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      weight: map['weight'],
      height: map['height'],
      gender: Gender.values.byName(map['gender']),
    );
  }
}

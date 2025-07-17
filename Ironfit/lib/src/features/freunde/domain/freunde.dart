import 'package:cloud_firestore/cloud_firestore.dart';

class Friend {
  final String id; // document ID
  final String userId; // mein userId
  final String friendId; //  userId's freunde
  final DateTime dateAdded;

  Friend({
    required this.id,
    required this.userId,
    required this.friendId,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'friendId': friendId,
      'dateAdded': dateAdded,
    };
  }

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      id: map['id'],
      userId: map['userId'],
      friendId: map['friendId'],
      dateAdded: (map['dateAdded'] as Timestamp).toDate(),
    );
  }
}

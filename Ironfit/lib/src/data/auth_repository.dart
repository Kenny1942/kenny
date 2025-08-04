import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String pw);
  Future<User?> createUserWithEmailAndPassword(String email, String pw);
  Future<void> signOut();
  Stream<User?> authStateChanges();

  Future<void> signInWithGoogle();
}

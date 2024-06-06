import 'package:education_app/core/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  Stream<User?> authUserState() {
    return _auth.authStateChanges();
  }

  User? currentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> createUser(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> logUserIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

@riverpod
AuthRepository authRepo(AuthRepoRef ref) {
  return AuthRepository(ref.read(firebaseAuthProvider));
}

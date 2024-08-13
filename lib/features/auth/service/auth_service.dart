import 'package:education_app/features/account/data/account_repo.dart';
import 'package:education_app/features/account/model/user_model.dart';
import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  final Ref _ref;

  const AuthService(Ref ref) : _ref = ref;

  Future<void> signUp(String email, String name, String password) async {
    try {
      final result =
          await _ref.read(authRepoProvider).createUser(email, password);

      final user = UserModel(
        email: result.user!.email!,
        name: name,
      );
      await _ref.read(accountRepoProvider).createAccount(
            result.user!.uid,
            user,
          );
    } on FirebaseAuthException catch (error) {
      throw Exception(error.toString());
    }
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref);
}

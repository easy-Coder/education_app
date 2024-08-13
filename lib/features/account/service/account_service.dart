import 'package:education_app/features/account/data/account_repo.dart';
import 'package:education_app/features/account/model/user_model.dart';
import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

class AccountService {
  final Ref _ref;

  AccountService(Ref ref) : _ref = ref;

  Future<void> createUserAccount(UserModel user) async {
    final currentUser = _ref.read(authRepoProvider).currentUser;
    if (currentUser != null) {
      await _ref.read(accountRepoProvider).createAccount(currentUser.uid, user);
    }
    throw Exception();
  }

  Future<UserModel> getUserAccount() async {
    final currentUser = _ref.read(authRepoProvider).currentUser;
    if (currentUser != null) {
      final user = await _ref.read(accountRepoProvider).getAccount(
            currentUser.uid,
          );
      return user;
    }
    throw Exception();
  }

  Future<void> updateUserAccount(UserModel user) async {
    final currentUser = _ref.read(authRepoProvider).currentUser;
    if (currentUser != null) {
      await _ref.read(accountRepoProvider).updateAccount(currentUser.uid, user);
    }
    throw Exception();
  }
}

@riverpod
FutureOr<UserModel> getAccount(GetAccountRef ref) {
  return ref.read(accountServiceProvider).getUserAccount();
}

@riverpod
AccountService accountService(AccountServiceRef ref) {
  return AccountService(ref);
}

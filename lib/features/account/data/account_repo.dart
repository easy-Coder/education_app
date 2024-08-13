import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/providers.dart';
import 'package:education_app/features/account/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repo.g.dart';

class AccountRepo {
  // it only create the interest
  // account should be in this schema
  // {
  //    name: User Name,
  //    email: User email,
  //    interests: 'Interest',
  //    level: 'Level'
  // }

  static const path = 'account';

  final FirebaseFirestore store;

  AccountRepo(this.store);

  Future<void> createAccount(String id, UserModel user) async {
    await store.collection(path).doc(id).set(user.toJson());
  }

  Future<UserModel> getAccount(String id) async {
    final result = await store.collection(path).doc(id).get();
    return UserModel.fromJson(result.data()!);
  }

  Future<void> updateAccount(String id, UserModel user) async {
    await store.collection(path).doc(id).update(user.toJson());
  }
}

@riverpod
AccountRepo accountRepo(AccountRepoRef ref) {
  return AccountRepo(ref.read(fireStoreProvider));
}

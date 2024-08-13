import 'package:education_app/features/account/model/user_model.dart';
import 'package:education_app/features/account/service/account_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboard_controller.g.dart';

@riverpod
class OnboardController extends _$OnboardController {
  @override
  Future<void> build() async {
    // no-op
  }

  Future<void> updateAccount(UserModel user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(accountServiceProvider).updateUserAccount(user));
  }
}

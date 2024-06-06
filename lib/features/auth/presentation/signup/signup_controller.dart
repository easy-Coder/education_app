import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> signup(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () => ref.read(authRepoProvider).createUser(email, password));
  }
}
import 'package:education_app/features/auth/presentation/signup/signup_controller.dart';
import 'package:education_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:education_app/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? email;
  String? password;

  String? name;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(signUpControllerProvider, (_, state) {
      if (!state.isLoading && state.hasError) {
        debugPrint('State: $state');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.error.toString()),
          ));
        return;
      }
      if (state.hasValue && !state.isLoading) {
        debugPrint('Here');
        context.goNamed(AppRoute.onboard.name);
      }
    });
    final signUpController = ref.watch(signUpControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Assets.svg.instructor.svg(),
              TextFormField(
                // key: _key,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                onSaved: (newValue) => setState(() => name = newValue),
              ),
              8.verticalSpace,
              TextFormField(
                // key: _key,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
                onSaved: (newValue) => setState(() => email = newValue),
              ),
              8.verticalSpace,
              TextFormField(
                // key: _key,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 8) {
                    return 'Password must 8 or more characters';
                  }
                  return null;
                },
                onSaved: (newValue) => setState(() => password = newValue),
              ),
              40.verticalSpace,
              ElevatedButton(
                onPressed: signUpController.isLoading
                    ? null
                    : () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          ref
                              .read(signUpControllerProvider.notifier)
                              .signup(name!, email!, password!);
                        }
                      },
                child: signUpController.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

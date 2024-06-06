import 'package:education_app/features/auth/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:education_app/gen/assets.gen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.svg.lady.svg(),
              TextFormField(
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
              const SizedBox(
                height: 8,
              ),
              TextFormField(
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
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: loginController.isLoading
                    ? null
                    : () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          ref
                              .read(loginControllerProvider.notifier)
                              .login(email!, password!);
                        }
                      },
                child: loginController.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

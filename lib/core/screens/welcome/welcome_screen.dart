import 'package:education_app/gen/assets.gen.dart';
import 'package:education_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Assets.svg.aPlus.svg(),
            const Text(
              "Let's find the 'A' with us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoute.register.name);
              },
              child: const Text('SignUp'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoute.login.name);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

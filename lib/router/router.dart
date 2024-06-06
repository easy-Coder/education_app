import 'package:education_app/core/screens/welcome/welcome_screen.dart';
import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:education_app/features/auth/presentation/login/login_screen.dart';
import 'package:education_app/features/auth/presentation/signup/signup_screen.dart';
import 'package:education_app/router/go_router_refresh.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum AppRoute { home, register, login, welcome }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRepo = ref.read(authRepoProvider);
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authRepo.authUserState()),
    redirect: (context, state) {
      final user = authRepo.currentUser();
      if (user == null &&
          (state.uri.path == '/login' || state.uri.path == '/register')) {
        return null;
      }

      return user == null ? '/welcome' : null;
    },
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/welcome',
        name: AppRoute.welcome.name,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRoute.register.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Home Screen'),
          ),
        ),
      ),
    ],
  );
}

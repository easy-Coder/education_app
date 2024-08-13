import 'package:education_app/core/screens/welcome/welcome_screen.dart';
import 'package:education_app/features/account/presentation/onboard/onboard_screen.dart';
import 'package:education_app/features/account/service/account_service.dart';
import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:education_app/features/auth/presentation/login/login_screen.dart';
import 'package:education_app/features/auth/presentation/signup/signup_screen.dart';
import 'package:education_app/features/course/model/course/course.dart';
import 'package:education_app/features/course/presentation/course/course_details.dart';
import 'package:education_app/features/course/presentation/courses/courses_screen.dart';
import 'package:education_app/features/quiz/presentation/quiz_screen.dart';
import 'package:education_app/router/go_router_refresh.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum AppRoute { home, course_details, register, login, welcome, onboard, quiz }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  final accountService = ref.watch(accountServiceProvider);
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authRepo.authUserState()),
    redirect: (context, state) async {
      final isLoggedIn = authRepo.currentUser != null;
      final path = state.uri.path;

      if (isLoggedIn) {
        final user = await accountService.getUserAccount();
        if (user.level == null && user.interest == null) {
          return '/onboard';
        }
        if (path.startsWith('/register') ||
            path.startsWith('/login') ||
            path.startsWith('/welcome')) {
          return '/courses';
        }
      } else {
        if (path.startsWith('/onboard') || path.startsWith('/courses')) {
          return '/welcome';
        }
      }
      return null;
    },
    initialLocation: '/courses',
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
        path: '/courses',
        name: AppRoute.home.name,
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/course',
        name: AppRoute.course_details.name,
        builder: (context, state) => CourseDetailScreen(
          course: state.extra as Course,
        ),
      ),
      GoRoute(
        path: '/quiz',
        name: AppRoute.quiz.name,
        builder: (context, state) => QuizScreen(
          course: state.extra as Course,
        ),
      ),
      GoRoute(
        path: '/onboard',
        name: AppRoute.onboard.name,
        builder: (context, state) => const OnboardScreen(),
      ),
    ],
  );
}

import 'package:education_app/features/course/model/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({required this.course, super.key});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Test your knowledge on ${course.title}'),
          23.verticalSpace,
          ElevatedButton(
            onPressed: () => null,
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

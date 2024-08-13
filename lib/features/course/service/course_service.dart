import 'package:education_app/core/providers.dart';
import 'package:education_app/features/account/service/account_service.dart';
import 'package:education_app/features/course/data/course_repository.dart';
import 'package:education_app/features/course/model/course/course.dart';
import 'package:education_app/features/course/model/course_video/course_video.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_service.g.dart';

class CourseService {
  final Ref _ref;

  const CourseService(Ref ref) : _ref = ref;

  Future<List<Course>> getCourses() async {
    try {
      final userAccount =
          await _ref.read(accountServiceProvider).getUserAccount();
      if (userAccount.interest != null) {
        return _ref.read(courseRepoProvider).getCourses(userAccount.interest!);
      }
      throw Exception('Error: Complete user onboard');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CourseVideo> getCourseVideo(String id) async {
    try {
      return _ref.read(courseRepoProvider).getCourseVideo(id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> summarizeVideo(CourseVideo courseVideo) async {
    try {
      final userAccount =
          await _ref.read(accountServiceProvider).getUserAccount();
      final textPart =
          TextPart("Summarize this course for a ${userAccount.level}");
      // final filePart = FileData(courseVideo.mime_type, courseVideo.storage_url);
      final prompt = [
        Content.text("Summarize Programming for a ${userAccount.level}"),
      ];
      final response = await _ref.read(modelProvider).generateContent(prompt);
      return response.text;
    } on FormatException catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}

@riverpod
CourseService courseService(CourseServiceRef ref) {
  return CourseService(ref);
}

@riverpod
Future<List<Course>> getCourses(GetCoursesRef ref) {
  return ref.watch(courseServiceProvider).getCourses();
}

@riverpod
Future<CourseVideo> getCourseVideo(GetCourseVideoRef ref, String id) {
  return ref.watch(courseServiceProvider).getCourseVideo(id);
}

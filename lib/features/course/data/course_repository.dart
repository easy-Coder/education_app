import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/providers.dart';
import 'package:education_app/features/course/model/course/course.dart';
import 'package:education_app/features/course/model/course_video/course_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_repository.g.dart';

class CourseRepo {
  final FirebaseFirestore _store;

  static const path = 'course';

  const CourseRepo(FirebaseFirestore store) : _store = store;

  Future<List<Course>> getCourses(String type) async {
    final result =
        await _store.collection(path).where('type', isEqualTo: type).get();
    return result.docs
        .map(
          (item) => Course.fromJson({'id': item.id, ...item.data()}),
        )
        .toList();
  }

  // TODO(easyCoder): add function to get course items

  Future<CourseVideo> getCourseVideo(String courseId) async {
    final result =
        await _store.collection('$path/$courseId/video').limit(1).get();
    return result.docs
        .map(
          (element) => CourseVideo.fromJson({
            'id': element.id,
            ...element.data(),
          }),
        )
        .toList()[0];
  }
}

@riverpod
CourseRepo courseRepo(CourseRepoRef ref) {
  return CourseRepo(ref.watch(fireStoreProvider));
}

import 'package:education_app/features/course/model/course_video/course_video.dart';
import 'package:education_app/features/course/service/course_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summarize_controller.g.dart';

@riverpod
class SummarizeController extends _$SummarizeController {
  @override
  Future<String?> build() async {
    return Future.value(null);
  }

  Future<void> summarize(CourseVideo courseVideo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(courseServiceProvider).summarizeVideo(courseVideo));
  }
}

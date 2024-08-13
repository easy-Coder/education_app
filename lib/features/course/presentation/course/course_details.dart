import 'dart:math';

import 'package:education_app/features/course/model/course/course.dart';
import 'package:education_app/features/course/model/course_video/course_video.dart';
import 'package:education_app/features/course/presentation/course/summarize_controller.dart';
import 'package:education_app/features/course/service/course_service.dart';
import 'package:education_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({required this.course, super.key});

  final Course course;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final courseVideoState =
        ref.watch(getCourseVideoProvider(widget.course.id!));
    return courseVideoState.when(
      data: (CourseVideo data) => WatchVideo(
        course: widget.course,
        courseVideo: data,
      ),
      error: (Object error, StackTrace stackTrace) => Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class WatchVideo extends ConsumerStatefulWidget {
  const WatchVideo(
      {super.key, required this.course, required this.courseVideo});

  final Course course;
  final CourseVideo courseVideo;

  @override
  ConsumerState<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends ConsumerState<WatchVideo> {
  late VideoController _controller;
  late Player player;

  @override
  void initState() {
    super.initState();
    player = Player();
    _controller = VideoController(player);
    player.open(Media(widget.courseVideo.url), play: false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final summarizeState = ref.watch(summarizeControllerProvider);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerScrolled) => [
          SliverAppBar(
            pinned: true,
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Quiz'),
              ),
            ],
          ),
          _SliverAppBarDelegate.makeHeader(
            Video(
              controller: _controller,
            ),
            height: MediaQuery.of(context).size.width * 9.0 / 16.0,
          ),
        ],
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.course.type,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              Text(
                widget.course.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.verticalSpace,
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              2.verticalSpace,
              Text(
                widget.course.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
              4.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.all(8.w),
                child: summarizeState.when(
                  data: (String? data) => data == null
                      ? buildSummarizeButton()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Summarize Video',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                4.horizontalSpace,
                                Assets.svg.ai.svg(
                                  width: 24.w,
                                  height: 24.w,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                              ],
                            ),
                            4.verticalSpace,
                            Text(
                              data,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                  error: (Object error, StackTrace stackTrace) =>
                      buildSummarizeButton(errorMessage: true),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSummarizeButton({bool errorMessage = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Summarize Video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Assets.svg.ai.svg(
              width: 24.w,
              height: 24.w,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          'Let our state of the art ai, summarize this video to you based on the level you choose previously.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
          ),
        ),
        if (errorMessage)
          Text(
            'Error: Something went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        8.verticalSpace,
        TextButton(
          onPressed: () => ref
              .read(summarizeControllerProvider.notifier)
              .summarize(widget.courseVideo),
          child: const Text(
            'Summarize',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  static SliverPersistentHeader makeHeader(
    Widget child, {
    required double height,
  }) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 200.0,
        maxHeight: 200.0,
        child: child,
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

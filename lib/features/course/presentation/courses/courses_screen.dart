import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app/features/auth/data/auth_repository.dart';
import 'package:education_app/features/course/model/course/course.dart';
import 'package:education_app/features/course/service/course_service.dart';
import 'package:education_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesState = ref.watch(getCoursesProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good evening!',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff364356),
                  ),
                ),
                Text(
                  'Hardline Scott',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff636d77),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(authRepoProvider).logout();
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'Populars Courses',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff364356),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            sliver: coursesState.when(
              data: (data) => data.isEmpty
                  ? SliverFillRemaining(
                      child: Column(
                        children: [
                          const Text(
                            'No course for this interset.',
                          ),
                          8.verticalSpace,
                          ElevatedButton(
                            onPressed: () => ref.refresh(getCoursesProvider),
                            child: const Text('Refresh'),
                          ),
                        ],
                      ),
                    )
                  : SliverList.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          CourseCard(course: data[index]),
                      separatorBuilder: (_, __) => 8.verticalSpace,
                      itemCount: data.length,
                    ),
              loading: () => const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
              error: (error, _) => SliverFillRemaining(
                child: Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(AppRoute.course_details.name, extra: course),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(28.r),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.grey.shade100,
              ),
              child: CachedNetworkImage(
                imageUrl: course.image,
                fit: BoxFit.cover,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      color: const Color(0xff364356),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                  8.verticalSpace,
                  RatingBar.builder(
                    initialRating: course.rating,
                    minRating: 1,
                    itemSize: 8.w,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.only(right: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) => null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

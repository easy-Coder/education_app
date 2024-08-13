import 'package:education_app/features/account/presentation/onboard/onboard_controller.dart';
import 'package:education_app/features/account/service/account_service.dart';
import 'package:education_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});

  @override
  ConsumerState<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends ConsumerState<OnboardScreen> {
  String? level;
  String? interest;
  int index = 0;

  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: index);
    controller.addListener(() {
      index = controller.page!.floor();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountState = ref.watch(getAccountProvider);
    final onboardState = ref.watch(onboardControllerProvider);
    ref.listen<AsyncValue>(onboardControllerProvider, (_, state) {
      if (state.hasError && !state.isLoading) {
        print(state);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.error.toString()),
          ));
        return;
      }
      if (state.hasValue && !state.isLoading) {
        context.pushNamed(AppRoute.home.name);
      }
    });
    return Scaffold(
        body: SafeArea(
      child: accountState.when(
        data: (data) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    OnboardChoices(
                      value: interest,
                      onChoose: (value) => setState(() {
                        interest = value;
                      }),
                      title: 'What is your interest?',
                      choices: const [
                        'Computer Science',
                        'Computer Engineer',
                        'Music',
                        'Literature',
                      ],
                    ),
                    OnboardChoices(
                      value: level,
                      onChoose: (value) => setState(() {
                        level = value;
                      }),
                      title: 'What is your level?',
                      choices: const [
                        'Beginner',
                        'Intermidiate',
                        'Professional',
                        'Expert',
                      ],
                    ),
                  ],
                ),
              ),
              69.verticalSpace,
              ElevatedButton(
                onPressed: index == 1
                    ? onboardState.isLoading
                        ? null
                        : () {
                            final user =
                                data.copyWith(interest: interest, level: level);
                            ref
                                .read(onboardControllerProvider.notifier)
                                .updateAccount(user);
                          }
                    : () {
                        controller.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn);
                      },
                child: index == 1
                    ? onboardState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : const Text('Continue')
                    : const Text('Next'),
              ),
            ],
          ),
        ),
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ));
  }
}

class OnboardChoices extends StatelessWidget {
  const OnboardChoices({
    super.key,
    required this.title,
    required this.choices,
    required this.onChoose,
    required this.value,
  });

  final String? value;
  final String title;
  final List<String> choices;
  final ValueChanged<String> onChoose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        31.verticalSpace,
        for (final choice in choices) ...[
          GestureDetector(
            onTap: () {
              onChoose(choice);
            },
            child: Container(
              height: 60.h,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 17,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffEDEDED),
                border: choice == value
                    ? Border.all(
                        color: const Color(0xff5667FD),
                      )
                    : null,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Text(
                    choice,
                    style: TextStyle(
                      fontSize: 18.sp,
                      // fontFamily: ``
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff636D77),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: choice == value
                            ? const Color(0xff5667FD)
                            : const Color(0xff636D77),
                      ),
                      color: choice == value ? const Color(0xff5667FD) : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.verticalSpace,
        ],
      ],
    );
  }
}

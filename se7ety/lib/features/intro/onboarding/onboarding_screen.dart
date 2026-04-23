import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/core/styles/colors.dart';
import 'package:se7ety/core/styles/text.dart';
import 'package:se7ety/core/widgets/custom_svg_picture.dart';
import 'package:se7ety/core/widgets/main_button.dart';
import 'package:se7ety/generated/locale_keys.g.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (currentPage != onboardingList.length - 1)
            TextButton(
              onPressed: () {
                SharedPref.setOnboardingShown();
                pushReplacement(context, Routes.welcome);
              },
              child: Text(
                LocaleKeys.skip.tr(),
                style: TextStyles.body.copyWith(color: AppColor.primaryColor),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 1),
                      CustomSvgPicture(
                        path: onboardingList[index].image,
                        width: 250,
                      ),
                      Spacer(flex: 1),
                      Text(
                        onboardingList[index].title,
                        style: TextStyles.title.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        onboardingList[index].description,
                        style: TextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(flex: 3),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: onboardingList.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColor.primaryColor,
                      dotColor: AppColor.greyColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                  ),
                  if (currentPage == onboardingList.length - 1)
                    MainButton(
                      minHeight: 45,
                      minWidth: 100,
                      text: LocaleKeys.lets_go.tr(),
                      onPressed: () {
                        SharedPref.setOnboardingShown();
                        pushReplacement(context, Routes.welcome);
                      },
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
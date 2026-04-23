import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/user_type_enum.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/styles/colors.dart';
import 'package:se7ety/core/styles/text.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
            top: 100,
            start: 25,
            end: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اهلا بيك',
                  style: TextStyles.headline.copyWith(
                    color: AppColor.primaryColor,
                    fontSize: 36,
                  ),
                ),
                const Gap(15),
                Text(
                  'سجل واحجز عند دكتورك وانت فالبيت',
                  style: TextStyles.body,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 80,
            start: 25,
            end: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتي كــ',
                    style: TextStyles.title.copyWith(
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildUserButton(
                    title: 'دكتور',
                    onTap: () {
                      pushTo(context, Routes.login, extra: UserTypeEnum.doctor);
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildUserButton(
                    title: 'مريض',
                    onTap: () {
                      pushTo(
                        context,
                        Routes.login,
                        extra: UserTypeEnum.patient,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildUserButton({
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColor.accentColor.withValues(alpha: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.title.copyWith(color: AppColor.darkColor),
          ),
        ),
      ),
    );
  }
}
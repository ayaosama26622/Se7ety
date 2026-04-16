import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/user_type_enum.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/function/validation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/styles/colors.dart';
import 'package:se7ety/core/styles/text.dart';
import 'package:se7ety/core/widgets/custom_text_from_field.dart';
import 'package:se7ety/core/widgets/main_button.dart';
import 'package:se7ety/core/widgets/password_from_field.dart';
import 'package:se7ety/features/auth/presentation/widgets/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.userType});
  final UserTypeEnum userType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;

  String handleUserType() {
    return widget.userType == UserTypeEnum.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
        onPressed: () {
        Navigator.pop(context);
      },
      ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, height: 200),
                  const SizedBox(height: 20),
                  Text(
                    'سجل دخول الان كـ "${handleUserType()}"',
                    style: TextStyles.title.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.end,
                    hintText: 'Sayed@example.com',
                    prefixIcon: Icon(Icons.email_rounded),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      } else if (!isEmailValid(value)) {
                        return 'من فضلك ادخل الايميل صحيحا';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25.0),
                  PasswordFromField(
                    hintText: '********',
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                      return null;
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsetsDirectional.only(
                      top: 10,
                      start: 10,
                    ),
                    child: Text('نسيت كلمة السر ؟', style: TextStyles.small),
                  ),
                  const Gap(20),
                  MainButton(
                    minHeight: 50,
                    minWidth: double.infinity,
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.whiteColor,
                    onPressed: () async {},
                    text: "تسجيل الدخول",
                  ),
                  const Gap(30),
                  SocialLogin(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لدي حساب ؟',
                          style: TextStyles.body.copyWith(
                            color: AppColor.darkColor,
                          ),
                        ),
                        const Gap(3),
                        TextButton(
                          onPressed: () {
                            pushReplacement(
                              context,
                              Routes.register,
                              extra: widget.userType,
                            );
                          },
                          child: Text(
                            'سجل الان',
                            style: TextStyles.body.copyWith(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/function/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/service/local/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isOnboardingShown = SharedPref.isOnboardingShown();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (isOnboardingShown) {
        pushReplacement(context, Routes.welcome);
      } else {
        pushReplacement(context, Routes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.logo, width: 250)),
    );
  }
}
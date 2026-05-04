import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/styles/colors.dart';

enum DialogType { success, error }

void showMyDialog(
  BuildContext context,
  String errorMsg, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 800),
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? AppColor.errorColor
          : Colors.green,
      content: Row(
        children: [
          const Icon(Icons.error, color: AppColor.whiteColor, size: 20),
          const Gap(10),
          Text(errorMsg),
        ],
      ),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColor.darkColor.withValues(alpha: 0.7),
    builder: (context) =>
        Center(child: Lottie.asset(AppImages.loadingJson, width: 250)),
  );
}
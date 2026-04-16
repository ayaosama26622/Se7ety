import 'dart:async';
import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/colors.dart';

class ResendOtpTimer extends StatefulWidget {
  const ResendOtpTimer({super.key});

  @override
  State<ResendOtpTimer> createState() => _ResendOtpTimerState();
}

class _ResendOtpTimerState extends State<ResendOtpTimer> {
  Timer? _timer;
  int _secondsRemaining = 120;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _canResend = false;
      _secondsRemaining = 120;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  String get timerText {
    final minutes = (_secondsRemaining ~/ 60).toString();
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _canResend
          ? TextButton(
              onPressed: () {
                startTimer();
              },
              child: const Text(
                "Resend OTP",
                style: TextStyle(
                  color: AppColor.errorColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Text(
              "Resend confirmation code ($timerText)",
              style: const TextStyle(fontSize: 18, color: AppColor.darkColor),
            ),
    );
  }
}

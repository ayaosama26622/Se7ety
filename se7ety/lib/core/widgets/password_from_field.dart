import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/colors.dart';

class PasswordFromField extends StatefulWidget {
  const PasswordFromField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<PasswordFromField> createState() => _PasswordFromFieldState();
}

class _PasswordFromFieldState extends State<PasswordFromField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      validator: widget.validator ??
          (input) {
            if (input == null || input.isEmpty) {
              return 'Please enter your password';
            } else if (input.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: AppColor.primaryColor,
        ),
        suffixIcon: IconButton(
          color: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.remove_red_eye,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
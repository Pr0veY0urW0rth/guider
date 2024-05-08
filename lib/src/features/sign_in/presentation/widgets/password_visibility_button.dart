import 'package:flutter/material.dart';

class PasswordVisibilityButton extends StatelessWidget {
  const PasswordVisibilityButton(
      {super.key, required this.isPasswordObscured, this.onTap});

  final bool isPasswordObscured;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () => onTap,
        child: Icon(isPasswordObscured
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded),
      ),
    );
  }
}

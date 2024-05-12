import 'package:flutter/material.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        color: Color(0xFF101213),
        fontSize: 36,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

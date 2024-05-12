import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF101213),
          fontSize: 36,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

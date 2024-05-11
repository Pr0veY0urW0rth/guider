import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInLink extends StatelessWidget {
  const SignInLink({super.key, this.onLinkTap});

  final VoidCallback? onLinkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: 'Нет аккаунта ',
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.black),
          children: [
            TextSpan(
              text: 'Давайте создадим!',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => onLinkTap!(),
            ),
          ],
        ),
      ),
    );
  }
}

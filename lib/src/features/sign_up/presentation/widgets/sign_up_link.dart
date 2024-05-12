import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key, this.onLinkTap});

  final VoidCallback? onLinkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Уже есть аккаунт? ',
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.black),
          children: [
            TextSpan(
              text: 'Давайте войдем!',
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

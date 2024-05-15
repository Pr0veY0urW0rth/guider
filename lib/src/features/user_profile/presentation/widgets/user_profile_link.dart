import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserProfileLink extends StatelessWidget {
  const UserProfileLink({super.key, this.onLinkTap});

  final VoidCallback? onLinkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: RichText(
        text: TextSpan(
          text: 'Забыли пароль? ',
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.black),
          children: [
            TextSpan(
              text: 'Давайте поменяем его! ',
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

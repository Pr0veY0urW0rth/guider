import 'package:flutter/material.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton(this.text,
      {super.key,
      this.height = 42,
      this.onPressed,
      this.fontSize = 16,
      this.enabled = true});

  final double fontSize;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
              enabled ? Colors.blue : Colors.grey.withOpacity(0.5)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.4, height)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

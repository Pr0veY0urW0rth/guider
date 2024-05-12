import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(this.text,
      {super.key,
      this.height = 42,
      this.onPressed,
      this.enabled = false,
      this.fontSize = 16});

  final bool enabled;
  final double fontSize;
  final double height;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              enabled ? Colors.blue : Colors.grey.withOpacity(0.5)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 40, height)),
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

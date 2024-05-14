import 'package:flutter/material.dart';

class CreateRouteButton extends StatelessWidget {
  const CreateRouteButton(this.text,
      {super.key, this.height = 42, this.onPressed, this.fontSize = 16});

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
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.4, height)),
        ),
        onPressed: onPressed,
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

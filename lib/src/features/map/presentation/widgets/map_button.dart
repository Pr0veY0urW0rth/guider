import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton(this.text,
      {super.key, this.height = 42, this.onPressed, this.fontSize = 14});

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
          minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.3, height)),
          maximumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.5, height)),
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

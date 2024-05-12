import 'package:flutter/material.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker({super.key, this.onTap, required this.code});
  final void Function()? onTap;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: onTap,
          child: Text(code),
        ),
      ),
    );
  }
}

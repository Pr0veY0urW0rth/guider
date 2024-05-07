import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.errorText,
      this.focusNode,
      this.hintText,
      this.inputType = TextInputType.text,
      required this.label,
      this.obscureText = false,
      this.onEditingComplete,
      this.suffixIcon,
      this.validator});

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType inputType;
  final String label;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          obscureText: obscureText,
          autocorrect: false,
          keyboardType: inputType,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        )
      ],
    );
  }
}

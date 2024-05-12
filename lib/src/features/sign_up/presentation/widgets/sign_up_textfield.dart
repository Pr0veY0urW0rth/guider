import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.errorText,
      this.focusNode,
      this.hintText,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.onEditingComplete,
      this.prefixIcon,
      this.suffixIcon,
      this.validator});

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType inputType;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          //Todo: fix issue with prefix icon
          hintText: hintText,
          //prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      obscureText: obscureText,
      autocorrect: false,
      keyboardType: inputType,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}

import 'package:flutter/material.dart';

class UserProfileField extends StatelessWidget {
  const UserProfileField({
    super.key,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.hintText,
    this.onEditingComplete,
    required this.label,
    required this.isEditable,
    required this.initalText,
    this.validator,
  });

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String label;
  final String initalText;
  final VoidCallback? onEditingComplete;
  final bool isEditable;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: label, hintText: hintText),
      autocorrect: true,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      readOnly: !isEditable,
      initialValue: initalText,
    );
  }
}

import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const InputComponent({
    super.key,
    required this.controller,
  this.obscureText = false,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}

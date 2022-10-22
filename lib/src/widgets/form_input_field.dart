import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputField extends StatelessWidget {
  const FormInputField(
      {super.key,
      required this.labelText,
      required this.keyboardType,
      required this.validator,
      this.inputFormatters,
      this.onSaved});
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
    );
  }
}

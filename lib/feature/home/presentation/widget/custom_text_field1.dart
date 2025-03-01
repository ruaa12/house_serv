import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.validator,
    required this.label,
    required this.labelText,
  }) : super(key: key);
  final String? Function(String?) validator;
  final String label;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.blue)),
        ),
        validator: validator);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.validator,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keybourdTybe,
    required this.onChanged,
    required String hint,
    required String labelText,
    required TextInputType keyboardType,
  });
  final String? Function(String?) validator;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keybourdTybe;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keybourdTybe,
        decoration: InputDecoration(
          fillColor: color7,
          filled: true,
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        validator: validator);
  }
}

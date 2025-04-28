import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class CustomTextField extends StatelessWidget {
  // ignore: use_super_parameters
  const CustomTextField({
    Key? key,
    required this.validator,
    required this.label,
    required this.labelText,
    required TextInputType keyboardType,
    required TextEditingController controller,
  }) : super(key: key);
  final String? Function(String?) validator;
  final String label;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          fillColor: color7,
          filled: true,
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.blue)),
        ),
        validator: validator);
  }
}

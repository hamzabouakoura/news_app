import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.controller,
      this.obscureText = false,
      this.inputType,
      this.color,
      this.onTap,
      this.readOnly = false});
  final String hint;
  final Color? color;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: inputType,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint,
        prefixIcon: IconButton(
          color: Colors.grey,
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

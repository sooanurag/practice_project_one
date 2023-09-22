import 'package:flutter/material.dart';

class CustomTestField {
  static TextFormField customTextFormField({
    required TextEditingController inputController,
    String? hintText,
  }) {
    return TextFormField(
      controller: inputController,
      decoration:  InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
    );
  }
}

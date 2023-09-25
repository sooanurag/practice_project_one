import 'package:flutter/material.dart';

class CustomTextField {
  TextFormField customTextFormField({
    required TextEditingController inputController,
    String? hintText,
  }) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Field can't be empty!";
        } else {
          return null;
        }
      },
      controller: inputController,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
    );
  }
}

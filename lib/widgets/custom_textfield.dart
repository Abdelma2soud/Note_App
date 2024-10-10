import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.mxlines = 1,
      this.controller,
      this.onsaved});
  final String text;
  final int mxlines;
  final TextEditingController? controller;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: mxlines,
      onSaved: onsaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
        hintText: text,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(
          kPrimaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color ?? Colors.white,
        width: 1.0,
      ),
    );
  }
}

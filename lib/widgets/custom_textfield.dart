import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.mxlines = 1});
  final String text;
  final int mxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: mxlines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
        hintText: text,
        hintStyle: const TextStyle(
          color: PRimarycolor,
        ),
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(
          PRimarycolor,
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

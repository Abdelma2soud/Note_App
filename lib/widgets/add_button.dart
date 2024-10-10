import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.txt, this.onPressed});
  final String txt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(txt,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black))),
    );
  }
}

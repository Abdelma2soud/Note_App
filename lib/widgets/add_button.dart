import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: PRimarycolor, borderRadius: BorderRadius.circular(16)),
      child: TextButton(
          onPressed: () {},
          child: Text(txt,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black))),
    );
  }
}

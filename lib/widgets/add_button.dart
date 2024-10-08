import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: PRimarycolor, borderRadius: BorderRadius.circular(16)),
      child: TextButton(
          onPressed: () {},
          child: const Text('Add',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black))),
    );
  }
}

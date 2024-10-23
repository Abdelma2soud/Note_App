import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.activatedColor, required this.backgroundColor});
  final bool activatedColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: activatedColor
            ? CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: backgroundColor,
                ),
              )
            : CircleAvatar(
                radius: 32,
                backgroundColor: backgroundColor,
              ));
  }
}

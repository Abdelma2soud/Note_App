import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.text, required this.icon, this.onPress});
  final String text;
  final IconData icon;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        const Spacer(),
        CustomAppBarIcon(
          icon: icon,
          onPress: onPress,
        )
      ],
    );
  }
}

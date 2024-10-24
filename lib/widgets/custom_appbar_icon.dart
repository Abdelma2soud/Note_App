import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({super.key, required this.icon, this.onPress});
  final IconData icon;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: IconButton(
          onPressed: onPress,
          icon: Icon(
            icon,
            size: 28,
          )),
    );
  }
}

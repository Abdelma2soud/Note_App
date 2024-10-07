import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.0),
          child: Text(
            'Notes',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        Spacer(),
        CustomSearchIcon()
      ],
    );
  }
}

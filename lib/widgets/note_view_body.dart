import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomAppBar(),
            CustomNoteItem(),
          ],
        ),
      ),
    );
  }
}

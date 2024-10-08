import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_note_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

// don't forget to add list of color to change the note item color by passing the index of listview to the list

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomAppBar(
              text: 'Notes',
              icon: Icons.search,
            ),
            NoteListView(),
          ],
        ),
      ),
    );
  }
}

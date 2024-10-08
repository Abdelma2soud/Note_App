import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/widgets/add_bottom_sheet.dart';
import 'package:note_app/widgets/note_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRimarycolor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}

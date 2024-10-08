import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});
  final List<MaterialColor> colors = const [
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => CustomNoteItem(
          color: colors[index],
        ),
        itemCount: colors.length,
      ),
    );
  }
}

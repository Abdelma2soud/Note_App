import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).noteModel ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return Dismissible(
                key: Key(note.title), // Unique key for each note
                direction:
                    DismissDirection.startToEnd, // Allow only swipe to delete
                onDismissed: (direction) {
                  // Remove the note from the list
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchData();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Note is deleted')));
                  print('note deleted successfully');
                },
                background: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: FaIcon(
                        FontAwesomeIcons.trash,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                child: CustomNoteItem(note: note),
              );
            },
          ),
        );
      },
    );
  }
}

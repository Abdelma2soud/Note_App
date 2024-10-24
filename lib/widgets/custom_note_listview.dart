import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> note =
            BlocProvider.of<NotesCubit>(context).noteModel ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => CustomNoteItem(
              note: note[index],
            ),
            itemCount: note.length,
          ),
        );
      },
    );
  }
}

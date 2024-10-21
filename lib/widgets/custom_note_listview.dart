import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
// import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> note = BlocProvider.of<NotesCubit>(context).noteModel!;
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => CustomNoteItem(
              note: note[index],
            ),
            itemCount: state is SuccessNoteState ? note.length : 0,
          ),
        );
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_textfield.dart';
import 'package:note_app/widgets/edit_note_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;

  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CustomAppBar(
                text: 'Edit Note',
                icon: Icons.check,
                onPress: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchData();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('edit note successfully')));
                  if (kDebugMode) {
                    print('edit note successfully');
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                onchanged: (value) {
                  title = value;
                },
                text: widget.note.title,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                text: widget.note.subtitle,
                mxlines: 5,
                onchanged: (value) {
                  subtitle = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              EditColorListView(
                noteModel: widget.note,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

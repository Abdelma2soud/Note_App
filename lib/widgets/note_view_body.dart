import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_note_listview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
// don't forget to add list of color to change the note item color by passing the index of listview to the list
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchData();
    super.initState();
  }

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

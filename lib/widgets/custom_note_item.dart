import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  // final MaterialColor color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditNoteView(
                        note: note,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(color: Colors.black, fontSize: 26),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: Text(note.subtitle,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18)),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchData();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Note is deleted')));
                        print('note deleted successfully');
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 25,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(note.date,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

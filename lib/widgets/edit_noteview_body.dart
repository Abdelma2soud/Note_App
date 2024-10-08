import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              CustomAppBar(text: 'Edit Note', icon: Icons.check),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: 'Tittle',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(text: 'Content', mxlines: 5),
            ],
          ),
        ),
      ),
    );
  }
}

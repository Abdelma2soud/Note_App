import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubit/add_note_cubit/add_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:note_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_button.dart';
import 'package:note_app/widgets/custom_color_list_view.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({
    super.key,
  });

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController contentcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          // autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: titlecontroller,
                text: 'Tittle',
                onsaved: (value) {
                  titlecontroller.text = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: contentcontroller,
                text: 'Content',
                mxlines: 5,
                onsaved: (value) {
                  contentcontroller.text = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const ColorListView(),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<AddNoteCubit, AddNoteStates>(
                builder: (context, state) {
                  return AddButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        NoteModel note = NoteModel(
                            title: titlecontroller.text,
                            subtitle: contentcontroller.text,
                            date: DateFormat('yyyy-mm-dd').format(
                              DateTime.now(),
                            ),
                            color: Colors.amberAccent.value);
                        BlocProvider.of<AddNoteCubit>(context).addNote(note);
                        BlocProvider.of<NotesCubit>(context).fetchData();
                      }
                      // else {
                      //   autovalidateMode = AutovalidateMode.always;
                      //   setState(() {});
                      // }
                    },
                    txt: state is LoadingState
                        ? const CircularProgressIndicator()
                        : const Text('Add',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

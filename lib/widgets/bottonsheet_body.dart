import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubit/add_note_cubit/add_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:note_app/widgets/add_button.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController contentcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is FailureAddingNoteState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('failed to adding notes')));
              print('failed to adding notes');
            }
            if (state is SuccessAddingNoteState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Adding Notes Successfully')));
              print('Adding Notes Successfully');
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SuccessAddingNoteState ? true : false,
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
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
                      height: 50,
                    ),
                    AddButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      txt: 'Add',
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

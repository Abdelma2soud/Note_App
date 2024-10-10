import 'package:flutter/material.dart';
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
      ),
    );
  }
}

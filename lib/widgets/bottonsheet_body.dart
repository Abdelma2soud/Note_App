import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_button.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
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
            SizedBox(
              height: 50,
            ),
            AddButton(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:note_app/widgets/form_bottom_sheet.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is FailureAddingNoteState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('failed to adding notes')));
            if (kDebugMode) {
              print('failed to adding notes');
            }
          }
          if (state is SuccessAddingNoteState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Adding Note Successfully')));
            if (kDebugMode) {
              print('Adding Note Successfully');
            }
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is LoadingState ? true : false,
            child: const FormBottomSheet(),
          );
        },
      ),
    );
  }
}

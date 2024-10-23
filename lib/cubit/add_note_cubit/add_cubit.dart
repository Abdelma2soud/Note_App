import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_states.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  // AddNoterCubit(super.initialState);
  AddNoteCubit() : super(InitialAddNoteState());
  Color color = const Color(0xffBAB700);
  addNote(NoteModel note) async {
    emit(LoadingState());
    try {
      note.color = color.value;
      var notebox = Hive.box<NoteModel>(
          kNoteBox); //1  حددت البوكس اللي شغال عليه وعشان هو (generic datatype) حددت الداتا اللي هشتغل عليها
      await notebox.add(note); // 2 هعمل add  للاوجيكت بتاعي
      emit(SuccessAddingNoteState());
    } on Exception catch (e) {
      emit(FailureAddingNoteState(errorMessage: e.toString()));
    }
  }
}

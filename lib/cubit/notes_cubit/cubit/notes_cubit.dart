import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  List<NoteModel>? noteModel;

  void fetchData() {
    //مفيش فيوتشر داتا فبالتالي مش هعوز اعمل لودينج ستيت
    //بالتالي مش هعوز تراي و كاتش هما مهمين ولكن يفضل استخدمهم عند الضرورة عشان عملية مكلفة
    //اNotesFailureStateبالتالي مش هعوز ال

    // try {
    var notebox = Hive.box<NoteModel>(
        kNoteBox); //1  حددت البوكس اللي شغال عليه وعشان هو (generic datatype) حددت الداتا اللي هشتغل عليها
    // List<NoteModel> noteModel = notebox.values.toList();
    noteModel = notebox.values.toList();
    emit(SuccessNoteState());

    // emit(SuccessNoteState(notes: noteModel!));
    // } catch (e) {
    //   emit(FailureNoteState(
    //       errorMessage: 'error with fetching data : ${e.toString()}'));
    // }
  }
}

part of 'notes_cubit.dart';

abstract class NotesStates {}

final class NotesInitialState extends NotesStates {}

class SuccessNoteState extends NotesStates {
  // final List<NoteModel> notes;

  // SuccessNoteState({required this.notes});
}

// class FailureNoteState extends NotesStates {
//   final String errorMessage;
//   FailureNoteState({required this.errorMessage});
// }

// class RefreshState extends NotesStates {}

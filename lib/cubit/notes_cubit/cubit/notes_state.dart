part of 'notes_cubit.dart';

abstract class NotesStates {}

final class NotesCubitInitial extends NotesStates {}

class SuccessNoteState extends NotesStates {
  final List<NoteModel> notes;

  SuccessNoteState({required this.notes});
}

class FailureNoteState extends NotesStates {
  final String errorMessage;
  FailureNoteState({required this.errorMessage});
}

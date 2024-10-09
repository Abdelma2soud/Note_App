abstract class AddNoteStates {}

class InitialAddNoteState extends AddNoteStates {}

class LoadingState extends AddNoteStates {}

class SuccessAddingNoteState extends AddNoteStates {}

class FailureAddingNoteState extends AddNoteStates {
  final String errorMessage;
  FailureAddingNoteState({required this.errorMessage});
}

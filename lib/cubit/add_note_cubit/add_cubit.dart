import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_states.dart';

class AddCubit extends Cubit<AddNoteStates> {
  AddCubit() : super(InitialAddNoteState());
}

import '../note_models/note_model.dart';

abstract class NotesStates {}

class NotesInitState extends NotesStates {}

class ChangeBottomNavState extends NotesStates {}

class SelectNoteTypeState extends NotesStates {}

class AddNewNoteState extends NotesStates {}

class NotesLoadedFromCacheState extends NotesStates {}

class DeleteNoteSuccessState extends NotesStates {}
class DeleteNoteErrorState extends NotesStates {
  final String message;
  DeleteNoteErrorState(this.message);
}


class UpdateNoteState extends NotesStates {}

class NotesSearchResultState extends NotesStates {}

class UpdateNoteSuccessState extends NotesStates {
  final NoteModel updatedNote;
  UpdateNoteSuccessState(this.updatedNote);
}

class UpdateNoteErrorState extends NotesStates {
  final String message;
  UpdateNoteErrorState(this.message);
}



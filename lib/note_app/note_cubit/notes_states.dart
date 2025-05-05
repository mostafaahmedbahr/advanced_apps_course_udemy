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



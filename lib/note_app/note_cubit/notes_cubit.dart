import 'package:flutter_bloc/flutter_bloc.dart';
import '../note_models/note_model.dart';
import '../note_models/notes_type_model.dart';
import '../note_screens/notes_screen.dart';
 import '../note_screens/notes_profile_screen.dart';
import 'notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitState());

  static NotesCubit get(context) => BlocProvider.of(context);

  static int notesPageIndex = 0;

  List notesScreens = [
    const NotesScreen(),
    const NotesProfileScreen(),
  ];


  void notesChangeBottomNav(index) {
    notesPageIndex = index  ;
    emit(ChangeBottomNavState());
  }

  List<NotesTypeModel> notesTypesList = [
    NotesTypeModel(title: "Notes", id: 1),
    NotesTypeModel(title: "Todo", id: 2),
    NotesTypeModel(title: "Blogs", id: 3),
  ];

  int selectedTypeIndex = 0 ;
  selectNoteType(int index)
  {
    selectedTypeIndex = index;
    emit(SelectNoteTypeState());
  }


  List<NoteModel> notesList = [];
  addNewNote(NoteModel newNote){
    notesList.add(newNote);
    emit(AddNewNoteState());
  }


}

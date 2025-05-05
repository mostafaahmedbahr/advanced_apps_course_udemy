import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:hive_flutter/adapters.dart';
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
    NotesTypeModel(title: "All", id: "All"),
    NotesTypeModel(title: "Personal", id: "Personal"),
    NotesTypeModel(title: "Work", id: "Work"),
    NotesTypeModel(title: "Ideas", id: "Ideas"),
  ];

  int selectedTypeIndex = 0 ;
  selectNoteType(int index)
  {
    selectedTypeIndex = index;
    emit(SelectNoteTypeState());
  }

  late Box<NoteModel> notesBox;
  List<NoteModel> notesList = [];
  Future<void> addNewNote(NoteModel newNote) async {
    await notesBox.add(newNote);
    notesList = notesBox.values.toList();
    emit(AddNewNoteState());
  }



  Future<void> deleteNoteById(int noteId) async {
    try {
      final key = notesBox.keys.firstWhere(
            (key) => notesBox.get(key)?.id == noteId,
        orElse: () => null,
      );
      if (key != null) {
        await notesBox.delete(key);
        notesList = notesBox.values.toList();
        emit(DeleteNoteSuccessState());
      } else {
        emit(DeleteNoteErrorState('Note not found'));
      }
    } catch (e) {
      emit(DeleteNoteErrorState(e.toString()));
    }
  }


  Future<void> initHive() async {
    await Hive.initFlutter(); // Initialize Hive
    Hive.registerAdapter(NoteModelAdapter()); // Register adapter
    notesBox = await Hive.openBox<NoteModel>('notes_box'); // Open box

    // Load existing notes
    notesList = notesBox.values.toList();
    emit(NotesLoadedFromCacheState());
  }

  // Update example
  Future<void> updateNote(int key, NoteModel updatedNote) async {
    await notesBox.put(key, updatedNote);
    notesList = notesBox.values.toList();
    emit(UpdateNoteState());
  }

  @override
  Future<void> close() async {
    await notesBox.close();
    super.close();
  }
}

import 'package:flutter/material.dart';
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

  final List<Widget> notesScreens = [
    const NotesScreen(),
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

  String searchQuery = '';
  void searchNotes(String query) {
    searchQuery = query.toLowerCase();
    emit(NotesSearchResultState());
  }
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

  Future<void> updateNoteById({
    required int noteId,
    required String newTitle,
    required String newContent,
    required String newType,
  }) async {
    try {
      // Find the Hive key matching the noteId
      final entry = notesBox.toMap().entries.firstWhere(
            (entry) => entry.value.id == noteId,
        orElse: () => throw Exception('Note not found'),
      );
      // Create updated note while preserving original data
      final updatedNote = NoteModel(
        noteTitle: newTitle,
        noteContent: newContent,
        noteType: newType,
        id: noteId, // Keep the same ID
        noteDate: DateTime.now(), // Update modified date
        // Preserve other fields if they exist
      );

      // Update using the found key
      await notesBox.put(entry.key, updatedNote);
      notesList = notesBox.values.toList();
      emit(UpdateNoteSuccessState(updatedNote));
    } catch (e) {
      emit(UpdateNoteErrorState(e.toString()));
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




  @override
  Future<void> close() async {
    await notesBox.close();
    super.close();
  }



}

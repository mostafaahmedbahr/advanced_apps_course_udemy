import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_states.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_widgets/notes_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context,state){
        var notesCubit =  NotesCubit.get(context);
        final personalNotes = notesCubit.notesList.where((note) => note.noteType == 'Personal').toList();
        final workNotes =     notesCubit.notesList.where((note) => note.noteType == 'Work').toList();
        final ideasNotes =    notesCubit.notesList.where((note) => note.noteType == 'Ideas').toList();
        final filterNotesList =
        notesCubit.selectedTypeIndex == 1 ? personalNotes :
        notesCubit.selectedTypeIndex == 2 ? workNotes :
        notesCubit.selectedTypeIndex == 3 ? ideasNotes :
        notesCubit.notesList;
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: filterNotesList.length,
            itemBuilder: (context, index) {
              return   NotesListItem(
                noteType: filterNotesList[index].noteType,
                noteId: filterNotesList[index].id,
                noteTitle: filterNotesList[index].noteTitle,
                noteContent:  filterNotesList[index].noteContent,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

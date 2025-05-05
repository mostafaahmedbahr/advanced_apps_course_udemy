import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_states.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_widgets/notes_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../note_models/note_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context,state){
        var notesCubit =  NotesCubit.get(context);
        List<NoteModel> displayNotes = notesCubit.notesList.where((note) {
          // Apply type filter if selected
          final typeMatch = notesCubit.selectedTypeIndex == 0 ||
              (notesCubit.selectedTypeIndex == 1 && note.noteType == 'Personal') ||
              (notesCubit.selectedTypeIndex == 2 && note.noteType == 'Work') ||
              (notesCubit.selectedTypeIndex == 3 && note.noteType == 'Ideas');
          // Apply search filter if active
          final searchMatch = notesCubit.searchQuery.isEmpty ||
              note.noteTitle.toLowerCase().contains(notesCubit.searchQuery) ||
              note.noteContent.toLowerCase().contains(notesCubit.searchQuery);
          return typeMatch && searchMatch;
        }).toList();
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: displayNotes.length,
            itemBuilder: (context, index) {
              return   NotesListItem(
                noteModel: displayNotes[index],
                noteType: displayNotes[index].noteType,
                noteId: displayNotes[index].id,
                noteTitle: displayNotes[index].noteTitle,
                noteContent:  displayNotes[index].noteContent,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

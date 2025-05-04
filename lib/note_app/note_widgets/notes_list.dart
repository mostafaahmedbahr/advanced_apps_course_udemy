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
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 16, // Vertical spacing between items
              crossAxisSpacing: 16, // Horizontal spacing between items
              childAspectRatio: 1, // Square items (adjust as needed)
            ),
            itemCount: NotesCubit.get(context).notesList.length, // Replace with your actual item count
            itemBuilder: (context, index) {
              final isBigItem = index % 3 == 0;
              return   NotesListItem(
                noteTitle: NotesCubit.get(context).notesList[index].noteTitle,
                noteContent:  NotesCubit.get(context).notesList[index].noteContent,
                isBig: isBigItem,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

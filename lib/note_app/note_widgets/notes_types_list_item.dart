import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesTypesListItem extends StatelessWidget {
  const NotesTypesListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context,state){
        final notesCubit = NotesCubit.get(context);
        final isSelected = notesCubit.selectedTypeIndex == index;
        return GestureDetector(
          onTap: (){
            notesCubit.selectNoteType(index);
          },
          child: Column(
            children: [
              Text(NotesCubit.get(context).notesTypesList[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              const SizedBox(height: 4),
              if(isSelected)// Spacing between text and line
              Container(
                height: 2,
                width: 45, // Adjust width as needed
                color: Colors.pink.withOpacity(0.4), // Match your app theme
              ),
            ],
          ),
        );
      },

    );
  }
}

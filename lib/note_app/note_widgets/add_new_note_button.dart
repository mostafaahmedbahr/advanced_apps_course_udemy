import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_widgets/show_add_note_bottom_sheet.dart';

class AddNewNoteButton extends StatelessWidget {
  const AddNewNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: 25, // Adjust height above the bar
      child: GestureDetector(
        onTap: () {
          showAddNoteBottomSheet(
            context,
            onNoteAdded: (newNote) {
            NotesCubit.get(context).addNewNote(newNote);

            },
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.4),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

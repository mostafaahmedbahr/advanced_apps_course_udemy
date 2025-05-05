import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_models/note_model.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_screens/edit_note_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListItem extends StatelessWidget {
  final int index;
  final String noteTitle;
  final int noteId;
  final String noteContent;
  final String noteType;
  final NoteModel noteModel;
  const NotesListItem({
    super.key,
    required this.index, required this.noteTitle, required this.noteContent, required this.noteId, required this.noteType, required this.noteModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) =>   EditNoteScreen(note: noteModel,)));
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _getItemColor(noteId), // Different colors for variety
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteTitle,
                    style: TextStyle(
                      fontSize:   18,
                      fontWeight: FontWeight.bold,
                      color: _getTextColor(index),
                    ),
                  ),
                    const SizedBox(height: 12),
                      Text(
                      noteContent,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
              ),
            ),
          ),
          IconButton(onPressed: (){
            context.read<NotesCubit>().deleteNoteById(noteId);
          },
              icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Color _getItemColor(int id) {
    final colors = [
      Colors.blue[100]!,
      Colors.green[100]!,
      Colors.orange[100]!,
      Colors.purple[100]!,
    ];
    return colors[id % colors.length];
  }

  Color _getTextColor(int id) {
    return Colors.grey[800]!;
  }
}

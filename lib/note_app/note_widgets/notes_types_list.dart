import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';

import 'notes_types_list_item.dart';

class NotesTypesList extends StatelessWidget {
  const NotesTypesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return NotesTypesListItem(
            index:index,
          );
        },
        separatorBuilder: (context,index){
          return const SizedBox(width: 30,);
        },
        itemCount: NotesCubit.get(context).notesTypesList.length,
    ),);
  }
}

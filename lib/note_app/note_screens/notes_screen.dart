import 'package:flutter/material.dart';

import '../note_widgets/notes_app_bar.dart';
import '../note_widgets/notes_list.dart';
import '../note_widgets/notes_search_field.dart';
import '../note_widgets/notes_types_list.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return     const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(right: 20,left: 20,top: 60,bottom: 20),
        child: Column(
          children: [
            NotesAppBar(),
            SizedBox(height: 30,),
            NotesSearchField(),
            SizedBox(height: 20,),
            NotesTypesList(),
            SizedBox(height: 20,),
            NotesList(),

          ],
        ),
      ),
    );
  }
}

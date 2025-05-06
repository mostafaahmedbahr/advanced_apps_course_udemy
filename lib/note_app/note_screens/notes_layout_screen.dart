import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../note_cubit/notes_states.dart';
import '../note_widgets/notes_bottom_nav_bar_items.dart';

class NotesLayoutScreen extends StatelessWidget {
  const NotesLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state) {
          return Scaffold(
            body:  NotesCubit.get(context).notesScreens[NotesCubit.notesPageIndex],
            bottomNavigationBar: const NotesBottomNavBarItems(),
          );
        }

    );
  }
}

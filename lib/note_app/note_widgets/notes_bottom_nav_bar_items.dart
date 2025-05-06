import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../note_cubit/notes_cubit.dart';
import '../note_cubit/notes_states.dart';
import 'add_new_note_button.dart';

class NotesBottomNavBarItems extends StatelessWidget {
  const NotesBottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Bottom Navigation Bar
        BlocBuilder<NotesCubit, NotesStates>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: NotesCubit .notesPageIndex,
              onTap: (index) {
                NotesCubit.get(context).notesChangeBottomNav(index);
              },
              selectedItemColor: Colors.pink.withOpacity(.4),
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(null), // Empty space for center button
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            );
          },
        ),
        const AddNewNoteButton(),
      ],
    );
  }
}
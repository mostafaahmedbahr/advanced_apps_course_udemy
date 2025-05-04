import 'package:flutter/material.dart';

import '../note_screens/notes_layout_screen.dart';

class NoteStartButton extends StatelessWidget {
  const NoteStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.pink.withOpacity(.4); // Default color
            },
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(8),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          shadowColor: MaterialStateProperty.all(
            Colors.pink.withOpacity(.4),),
          overlayColor: MaterialStateProperty.all(Colors.pink.withOpacity(.4),),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => const NotesLayoutScreen()));
        },
        child: const Text(
          "Get Started",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

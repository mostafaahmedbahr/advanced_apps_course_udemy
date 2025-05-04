import 'package:flutter/material.dart';

import '../note_models/note_model.dart';

void showAddNoteBottomSheet(BuildContext context, {required Function(NoteModel) onNoteAdded}) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String selectedType = 'Personal'; // Default type
  final DateTime currentDate = DateTime.now();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: contentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedType,
                items: const [
                  DropdownMenuItem(value: 'Personal', child: Text('Personal')),
                  DropdownMenuItem(value: 'Work', child: Text('Work')),
                  DropdownMenuItem(value: 'Ideas', child: Text('Ideas')),
                ],
                onChanged: (value) {
                  selectedType = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Note Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    final newNote = NoteModel(
                      noteTitle: titleController.text,
                      noteContent: contentController.text,
                      noteType: selectedType,
                      id: DateTime.now().millisecondsSinceEpoch, // Unique ID
                      noteDate: currentDate,
                    );
                    onNoteAdded(newNote);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Note'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
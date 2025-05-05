import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_states.dart';
  import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel note;

  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late String _selectedType;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.noteTitle);
    _contentController = TextEditingController(text: widget.note.noteContent);
    _selectedType = widget.note.noteType;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Color _getNoteColor() {
    // Use the same color logic as your NotesListItem
    final colors = [
      Colors.blue[100]!,
      Colors.green[100]!,
      Colors.orange[100]!,
      Colors.purple[100]!,
    ];
    return colors[widget.note.id % colors.length];
  }
  bool _hasChanges() {
    return _titleController.text != widget.note.noteTitle ||
        _contentController.text != widget.note.noteContent ||
        _selectedType != widget.note.noteType;
  }
  @override
  Widget build(BuildContext context) {
    final noteColor = _getNoteColor();
    return BlocConsumer<NotesCubit,NotesStates>(
      listener: (context,state){
        if(state is UpdateNoteSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Updated is Done")),
        );
          Navigator.pop(context);
        }

      },
      builder: (context,state){
        return Scaffold(
          backgroundColor: noteColor,
          appBar: AppBar(
            backgroundColor: noteColor,
            title: const Text("Edit Your Note"),
            actions: [
              IconButton(
                icon: const Icon(Icons.check_circle_outline),
                onPressed: () {
                  if (_hasChanges()) {
                    context.read<NotesCubit>().updateNoteById(
                      noteId: widget.note.id,
                      newTitle: _titleController.text,
                      newContent: _contentController.text,
                      newType: _selectedType,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
          body: Hero(
            tag: 'note-bg-${widget.note.id}',
            child: Container(
              decoration: BoxDecoration(
                color: noteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.pink.withOpacity(.4),
                      controller: _titleController,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.grey[600], // Label color when not focused
                        ),
                        // Enabled (not focused) border
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.4),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // Focused border (pink)
                        focusedBorder: OutlineInputBorder(
                          borderSide:   BorderSide(
                            color: Colors.pink.withOpacity(.4),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.pink.withOpacity(.4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedType,
                      items: const [
                        DropdownMenuItem(value: 'Personal', child: Text('Personal')),
                        DropdownMenuItem(value: 'Work', child: Text('Work')),
                        DropdownMenuItem(value: 'Ideas', child: Text('Ideas')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Note Type',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        floatingLabelStyle: TextStyle(
                          color:Colors.pink.withOpacity(.4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.4),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pink.withOpacity(.4),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      dropdownColor: Colors.white, // Dropdown background
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                      iconEnabledColor: Colors.pink.withOpacity(.4),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          labelText: 'Content',
                          labelStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.pink.withOpacity(.4),
                          ),
                          hintText: 'Write your note here...',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          focusedBorder:   UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink.withOpacity(.4),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder( // Grey underline when inactive
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        cursorColor: Colors.pink.withOpacity(.4),
                        maxLines: null, // Unlimited lines
                        expands: true, // Fill available space
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }


}
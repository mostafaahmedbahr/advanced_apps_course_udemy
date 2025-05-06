import 'package:flutter/material.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_cubit.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_cubit/notes_states.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_models/note_model.dart';
import 'package:flutter_advanced_applications_course_udemy_2025/note_app/note_screens/edit_note_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/sh.dart';

class NotesProfileScreen extends StatefulWidget {
  const NotesProfileScreen({super.key});

  @override
  State<NotesProfileScreen> createState() => _NotesProfileScreenState();
}

class _NotesProfileScreenState extends State<NotesProfileScreen> {
  late String _userName;
  late String _userEmail;

  @override
  void initState() {
    super.initState();
    // Initialize with default values
    _userName = 'Sarah Johnson';
    _userEmail = 'sarah.johnson@example.com';
  }

  Future<void> _editProfile() async {
    final result = await showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        initialName:   SharedPreferencesHelper.getData(key: "UserName") ?? _userName,
        initialEmail:    SharedPreferencesHelper.getData(key: "UserEmail") ?? _userEmail,
      ),
    );

    if (result != null) {
      setState(() {
        _userName = result['name'];
        _userEmail = result['email'];
        SharedPreferencesHelper.saveData(key: "UserName", value: _userName);
        SharedPreferencesHelper.saveData(key: "UserEmail", value: _userEmail);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,top: 60,bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Profile Section
                  _buildUserProfileSection(),
                  const SizedBox(height: 24),

                  // Stats Section
                  _buildStatsSection(NotesCubit.get(context).notesList),
                  const SizedBox(height: 24),

                  // Recent Notes Section
                  _buildRecentNotesSection(NotesCubit.get(context).notesList),
                ],
              ),
            ),
          ),
        );
      },

    );
  }

  Widget _buildUserProfileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              SharedPreferencesHelper.getData(key: "UserName") ?? _userName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              SharedPreferencesHelper.getData(key: "UserEmail") ??_userEmail,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),

          ],
        ),
        OutlinedButton(
          onPressed: _editProfile,
          child:   Text('Edit Profile',
          style: TextStyle(
            color: Colors.pink.withOpacity(.4),
          ),),
        ),
      ],
    );
  }

  Widget _buildStatsSection(List<NoteModel> notes) {
    final personalNotes = notes.where((note) => note.noteType == 'Personal').length;
    final workNotes = notes.where((note) => note.noteType == 'Work').length;
    final ideaNotes = notes.where((note) => note.noteType == 'Ideas').length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Stats',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatCard('Total Notes', notes.length.toString(), Icons.note),
            _buildStatCard('Personal', personalNotes.toString(), Icons.person),
            _buildStatCard('Work', workNotes.toString(), Icons.work),
            _buildStatCard('Ideas', ideaNotes.toString(), Icons.lightbulb),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentNotesSection(List<NoteModel> notes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Notes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(
                  _getNoteTypeIcon(note.noteType),
                  color: _getNoteTypeColor(note.noteType),
                ),
                title: Text(note.noteTitle),
                subtitle: Text(
                  note.noteContent,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditNoteScreen(note: note);
                  }));
                },
              ),
            );
          },
        ),
      ],
    );
  }

  IconData _getNoteTypeIcon(String type) {
    switch (type) {
      case 'Work':
        return Icons.work;
      case 'Ideas':
        return Icons.lightbulb;
      default:
        return Icons.person;
    }
  }

  Color _getNoteTypeColor(String type) {
    switch (type) {
      case 'Work':
        return Colors.blue;
      case 'Ideas':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }
}

class EditProfileDialog extends StatefulWidget {
  final String initialName;
  final String initialEmail;

  const EditProfileDialog({
    super.key,
    required this.initialName,
    required this.initialEmail,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _emailController = TextEditingController(text: widget.initialEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, {
              'name': _nameController.text,
              'email': _emailController.text,
            });
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
import 'package:hive/hive.dart';

part 'note_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique type ID
class NoteModel {
  @HiveField(0)
  final String noteTitle;
  @HiveField(1)
  final String noteContent;
  @HiveField(2)
  final String noteType;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final DateTime noteDate;


  NoteModel({
    required this.noteTitle,
    required this.noteContent,
    required this.noteType,
    required this.id,
    required this.noteDate
  });
}
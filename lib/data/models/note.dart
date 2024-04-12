import 'package:floor/floor.dart';
import 'package:notes_app/domain/entities/note.dart';

@Entity(tableName: 'NoteModel')
class NoteModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String content;
  final int timestamp;

  NoteModel(
      {this.id,
      required this.title,
      required this.content,
      required this.timestamp});

  factory NoteModel.toNoteModel(NoteEntity note) => NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      timestamp: note.timestamp);

  NoteEntity toNoteEntity() =>
      NoteEntity(id: id, title: title, content: content, timestamp: timestamp);
}

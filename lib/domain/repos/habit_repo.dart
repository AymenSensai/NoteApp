import 'package:notes_app/domain/entities/note.dart';

abstract class NoteRepo {
  Future<List<NoteEntity>> getNotes();

  void insertNote(NoteEntity habit);
}

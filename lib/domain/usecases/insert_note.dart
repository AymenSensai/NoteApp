import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/domain/repos/habit_repo.dart';

class InsertNoteUseCase {
  final NoteRepo _repository;

  InsertNoteUseCase(this._repository);

  void call(NoteEntity note) {
    _repository.insertNote(note);
  }
}

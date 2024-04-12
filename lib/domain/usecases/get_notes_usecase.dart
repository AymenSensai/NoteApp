import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/domain/repos/habit_repo.dart';

class GetNotesUseCase {
  final NoteRepo _repository;

  GetNotesUseCase(this._repository);

  Future<List<NoteEntity>> call() async {
    return await _repository.getNotes();
  }
}

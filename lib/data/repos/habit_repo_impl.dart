import 'package:notes_app/data/local/app_database.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/domain/repos/habit_repo.dart';

class NoteRepositoryImpl extends NoteRepo {
  final AppDatabase _appDatabase;

  NoteRepositoryImpl(this._appDatabase);

  @override
  Future<List<NoteEntity>> getNotes() async {
    final notes = await _appDatabase.noteDao.getNotes();
    List<NoteEntity> notesEntites =
        notes.map((entity) => entity.toNoteEntity()).toList();
    return notesEntites;
  }

  @override
  void insertNote(NoteEntity habit) async {
    _appDatabase.noteDao.insertNote(NoteModel.toNoteModel(habit));
  }
}

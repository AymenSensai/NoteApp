import 'package:floor/floor.dart';
import 'package:notes_app/data/models/note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM NoteModel ORDER BY timestamp DESC')
  Future<List<NoteModel>> getNotes();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(NoteModel note);
}

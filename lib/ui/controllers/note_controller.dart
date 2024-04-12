import 'package:get/get.dart';
import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/domain/usecases/get_notes_usecase.dart';
import 'package:notes_app/domain/usecases/insert_note.dart';

class NoteController extends GetxController {
  NoteController(this._getNotesUseCase, this._insertNoteUseCase);
  final GetNotesUseCase _getNotesUseCase;
  final InsertNoteUseCase _insertNoteUseCase;

  List<NoteEntity> notes = [];

  void getNotes() async {
    notes = await _getNotesUseCase.call();
    update();
  }

  void insertNote(NoteEntity note) {
    _insertNoteUseCase.call(note);
  }
}

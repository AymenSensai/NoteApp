import 'package:get/get.dart';
import 'package:notes_app/data/local/app_database.dart';
import 'package:notes_app/data/repos/habit_repo_impl.dart';
import 'package:notes_app/domain/repos/habit_repo.dart';
import 'package:notes_app/domain/usecases/get_notes_usecase.dart';
import 'package:notes_app/domain/usecases/insert_note.dart';
import 'package:notes_app/ui/controllers/note_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteRepo>(() => NoteRepositoryImpl(Get.find()));
    Get.lazyPut<GetNotesUseCase>(() => GetNotesUseCase(Get.find()));
    Get.lazyPut<InsertNoteUseCase>(() => InsertNoteUseCase(Get.find()));
    Get.put(NoteController(Get.find(), Get.find()));
  }

  Future<void> asyncDependencies() async {
    final database =
        $FloorAppDatabase.databaseBuilder('app_database.db').build();

    await Get.putAsync<AppDatabase>(() => database, permanent: true);
  }
}

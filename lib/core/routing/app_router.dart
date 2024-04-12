import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes_app/core/routing/routes.dart';
import 'package:notes_app/ui/screens/add_edit_note_screen.dart';
import 'package:notes_app/ui/screens/notes_screen.dart';
import 'package:notes_app/ui/screens/welcome_screen.dart';

class AppRouter {
  List<GetPage> generateRoute() {
    final getPages = [
      GetPage(
        name: Routes.welcome,
        page: () => const WelcomeScreen(),
      ),
      GetPage(
        name: Routes.notes,
        page: () => const NotesScreen(),
      ),
      GetPage(
        name: Routes.addEditNote,
        page: () => const AddEditNoteScreen(),
      ),
    ];

    return getPages;
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/core/theming/styles.dart';
import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/ui/widgets/note_list_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<NoteEntity> notes;

  CustomSearchDelegate({required this.notes});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      textTheme: TextTheme(titleLarge: TextStyles.font16WhiteMedium),
      appBarTheme: theme.appBarTheme.copyWith(
        color: ColorsManager.darkPurple,
      ),
      hintColor: ColorsManager.white,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<NoteEntity> searchednote = notes
        .where((note) => note.title.toLowerCase().startsWith(query))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(child: NoteListView(notes: searchednote)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<NoteEntity> searchednote = notes
        .where((note) => note.title.toLowerCase().startsWith(query))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(child: NoteListView(notes: searchednote)),
    );
  }
}

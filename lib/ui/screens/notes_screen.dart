import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/routing/routes.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/ui/controllers/note_controller.dart';
import 'package:notes_app/ui/widgets/custom_search_delegate.dart';
import 'package:notes_app/ui/widgets/note_list_view.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final noteController = Get.find<NoteController>();

  @override
  void initState() {
    super.initState();
    noteController.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(builder: (_) {
      final notes = noteController.notes;
      return Scaffold(
          appBar: _homeAppBar(context, notes),
          floatingActionButton: _fab(),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: NoteListView(notes: notes)),
          )));
    });
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(Routes.addEditNote),
      shape: const CircleBorder(),
      backgroundColor: ColorsManager.purple,
      foregroundColor: ColorsManager.white,
      child: const Icon(Icons.add),
    );
  }

  AppBar _homeAppBar(BuildContext context, List<NoteEntity> notes) {
    return AppBar(
      title: const Text('Notes'),
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      actions: [
        IconButton(
          onPressed: () => showSearch(
              context: context, delegate: CustomSearchDelegate(notes: notes)),
          icon: SvgPicture.asset('assets/svgs/search.svg'),
        )
      ],
    );
  }
}

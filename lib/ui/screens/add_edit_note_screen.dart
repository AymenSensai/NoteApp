import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/ui/controllers/note_controller.dart';
import 'package:notes_app/ui/widgets/app_text_field.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final note = Get.arguments;

  @override
  void initState() {
    super.initState();
    _titleController.text = note?.title ?? '';
    _contentController.text = note?.content ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _addNoteAppBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextField(
                  hintText: 'Title',
                  controller: _titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title should not be empty';
                    }
                  },
                  maxLines: 1,
                ),
                const SizedBox(height: 16.0),
                AppTextField(
                  hintText: 'Content',
                  controller: _contentController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Content should not be empty';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  AppBar _addNoteAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset('assets/svgs/back_arrow_ios_circle.svg')),
        actions: [
          IconButton(
              onPressed: () => _validateThenSaveNote(context),
              icon: SvgPicture.asset('assets/svgs/check_circle.svg'))
        ],
        forceMaterialTransparency: true);
  }

  void _validateThenSaveNote(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Get.find<NoteController>().insertNote(NoteEntity(
          id: note?.id,
          title: _titleController.text,
          content: _contentController.text,
          timestamp: DateTime.now().millisecondsSinceEpoch));
      Get.find<NoteController>().getNotes();
      Get.back();
    }
  }
}

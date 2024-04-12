import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/routing/routes.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/core/theming/styles.dart';
import 'package:notes_app/domain/entities/note.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key, required this.notes});

  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return MasonryView(
      listOfItem: notes,
      numberOfColumn: 2,
      itemBuilder: (note) {
        return _noteItem(note, context);
      },
    );
  }

  Widget _noteItem(NoteEntity note, BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.addEditNote, arguments: note),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: ColorsManager.lightPurple),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyles.font18WhiteMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Text(
              note.content,
              style: TextStyles.font12GrayRegular,
            ),
            const SizedBox(height: 8.0),
            Text(
              _formatDate(note.timestamp),
              style: TextStyles.font12darkGrayRegular,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }
}

class NoteEntity {
  final int? id;
  final String title;
  final String content;
  final int timestamp;

  NoteEntity(
      {this.id,
      required this.title,
      required this.content,
      required this.timestamp});
}

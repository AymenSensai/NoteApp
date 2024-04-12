import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:notes_app/data/local/dao/note_dao.dart';
import 'package:notes_app/data/models/note.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [NoteModel])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}

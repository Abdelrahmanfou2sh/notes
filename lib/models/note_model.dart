import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.title,
      required this.description,
      required this.date,
      required this.color});
}

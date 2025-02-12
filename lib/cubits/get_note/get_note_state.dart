part of 'get_note_cubit.dart';

@immutable
sealed class GetNoteState {}

final class GetNoteInitial extends GetNoteState {}
final class GetNoteSuccess extends GetNoteState {
  List<NoteModel> notes;
  GetNoteSuccess(this.notes);
}
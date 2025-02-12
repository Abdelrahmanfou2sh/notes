import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  List<NoteModel> notes = [];
  getNotes(){
      notes = Hive.box<NoteModel>('notes_box').values.toList();
      emit(GetNoteSuccess(notes));
  }
}

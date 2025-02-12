import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Color(0xffAC3931);
  addNote(NoteModel note) async{
    note.color = color.value;
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteModel>('notes_box');
      notesBox.add(note);
      emit(AddNoteSuccess());
      emit(AddNoteColorSuccess());
    }catch(e){
      emit(AddNoteFailure(e.toString()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<GetNoteCubit>(context).notes;
        return ListView.separated(itemBuilder: (context, index) {
          return NoteItem(note: notes[index],);
        },
          itemCount: notes.length, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10,);
          },
        );
      },
    );
  }
}
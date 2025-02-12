import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_colors_list.dart';

class EditNoteView extends StatefulWidget {
  EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  TextEditingController? titleController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  if (titleController!.text.isEmpty ||
                      descriptionController!.text.isEmpty) {
                    widget.note.title;
                    widget.note.description;
                  } else {
                    widget.note.title = titleController!.text;
                    widget.note.description = descriptionController!.text;
                  }
                  widget.note.save();
                  Navigator.pop(context);
                  BlocProvider.of<GetNoteCubit>(context).getNotes();
                },
              ),
              const SizedBox(height: 50),
              CustomTextField(
                hintText: widget.note.title,
                maxLines: 1,
                controller: titleController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: widget.note.description,
                maxLines: 5,
                controller: descriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              EditNoteColorsList(
                selectedIndex: selectedColorIndex,
                onColorSelected: (index) {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

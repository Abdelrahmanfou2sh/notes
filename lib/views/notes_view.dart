import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes__list__view.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/note_item.dart';
import 'package:notes_app/widgets/notes_search_bar.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  String searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetNoteCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return AddNoteBottomSheet();
                  });
            },
            child: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Notes',
                  icon: Icons.search,
                ),
                const SizedBox(
                  height: 30,
                ),
                NotesSearchBar(
                  onSearch: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: BlocBuilder<GetNoteCubit, GetNoteState>(
                    builder: (context, state) {
                      if (state is GetNoteSuccess) {
                        List<NoteModel> filteredNotes = state.notes
                            .where((note) =>
                                note.title
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                note.description
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()))
                            .toList();

                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: filteredNotes.length,
                          itemBuilder: (context, index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: NoteItem(
                                note: filteredNotes[index],
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

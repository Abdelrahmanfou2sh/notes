import 'package:flutter/material.dart';

class NotesSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const NotesSearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'ابحث في ملاحظاتك...',
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

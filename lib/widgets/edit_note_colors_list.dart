import 'package:flutter/material.dart';
import '../../constants.dart';

class EditNoteColorsList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onColorSelected;

  const EditNoteColorsList({
    super.key,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onColorSelected(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: kColors[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.white
                        : Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: selectedIndex == index
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

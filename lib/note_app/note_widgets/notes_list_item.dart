import 'package:flutter/material.dart';

class NotesListItem extends StatelessWidget {
  final bool isBig;
  final int index;
  final String noteTitle;
  final String noteContent;
  const NotesListItem({
    super.key,
    required this.isBig,
    required this.index, required this.noteTitle, required this.noteContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getItemColor(index), // Different colors for variety
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteTitle,
              style: TextStyle(
                fontSize: isBig ? 20 : 16,
                fontWeight: FontWeight.bold,
                color: _getTextColor(index),
              ),
            ),
            if (isBig) ...[
              const SizedBox(height: 12),
                Text(
                noteContent,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getItemColor(int index) {
    final colors = [
      Colors.blue[100]!,
      Colors.green[100]!,
      Colors.orange[100]!,
      Colors.purple[100]!,
    ];
    return colors[index % colors.length];
  }

  Color _getTextColor(int index) {
    return Colors.grey[800]!;
  }
}

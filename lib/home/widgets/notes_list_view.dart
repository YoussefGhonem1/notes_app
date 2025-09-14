import 'package:flutter/material.dart';
import 'package:notes2_app/home/widgets/note_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NoteTile();
              },
              itemCount: 10,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
            ),
          );
  }
}
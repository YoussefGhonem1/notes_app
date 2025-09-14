import 'package:flutter/material.dart';
import 'package:notes2_app/home/screens/edit_note.dart';

class NoteOptionsSheet extends StatelessWidget {
  const NoteOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            tileColor: Colors.blue[50],
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.edit, color: Colors.blue),
            ),
            title: const Text(
              'تعديل الملاحظة',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNote(oldTitle: "Text", oldContent: "Text one"),
                ),
              );
            },
          ),
          SizedBox(height: 8),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            tileColor: Colors.red[50],
            leading: CircleAvatar(
              backgroundColor: Colors.red[100],
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            title: const Text(
              'حذف الملاحظة',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

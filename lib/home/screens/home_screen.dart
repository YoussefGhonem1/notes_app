import 'package:flutter/material.dart';
import 'package:notes2_app/home/screens/add_note.dart';
import 'package:notes2_app/home/widgets/empty_notes.dart';
import 'package:notes2_app/home/widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "ملاحظاتى",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'البحث عن ملاحظات ....',
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
          NotesListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add, color: Colors.blueGrey[100]),
      ),
    );
  }
}

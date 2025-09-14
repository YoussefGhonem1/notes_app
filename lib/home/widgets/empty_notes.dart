import 'package:flutter/material.dart';
import 'package:notes2_app/home/screens/add_note.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150),
        CircleAvatar(
          backgroundColor: Colors.blueGrey[200],
          radius: 70,
          child: Icon(Icons.add_box_outlined, size: 60),
        ),
        SizedBox(height: 20),
        Text(
          "لا توجد ملاحظات",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("ابدا باضافه ملاحظتك الاولى", style: TextStyle(fontSize: 14)),
        Text("و احتفظ بافكارك المهمه", style: TextStyle(fontSize: 14)),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.purple),
            ),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddNote()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "اضافه ملاحظه",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

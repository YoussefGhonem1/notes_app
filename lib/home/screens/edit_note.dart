import 'package:flutter/material.dart';

class EditNote extends StatelessWidget {
  final String oldTitle;
  final String oldContent;

  const EditNote({
    super.key,
    required this.oldTitle,
    required this.oldContent,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: oldTitle);
    TextEditingController contentController = TextEditingController(text: oldContent);

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      "تعديل الملاحظة",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.purple[300],
                        ),
                      ),
                      onPressed: () {
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "تحديث",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.title, color: Colors.purple),
                hintText: 'العنوان',
                filled: true,
                fillColor: Colors.blueGrey[50],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: contentController,
              maxLines: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'اكتب ملاحظتك هنا ....',
                filled: true,
                fillColor: Colors.blueGrey[50],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

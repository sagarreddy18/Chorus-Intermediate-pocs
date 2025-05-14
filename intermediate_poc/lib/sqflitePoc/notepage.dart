import 'package:flutter/material.dart';
import 'package:intermediate_poc/sqflitePoc/db_helper.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> notes = [];
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  int? editingId;
  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  void refreshNotes() async {
    final data = await dbHelper.getNotes();
    setState(() {
      notes = data;
    });
  }

  void saveNote() async {
    final title = titleController.text;
    final content = contentController.text;

    if (title.isEmpty || content.isEmpty) return;

    if (editingId == null) {
      await dbHelper.insertNote({'title': title, 'content': content});
    } else {
      await dbHelper.updateNote({'id': editingId, 'title': title, 'content': content});
      editingId = null;
    }

    titleController.clear();
    contentController.clear();
    refreshNotes();
  }

  void startEdit(Map<String, dynamic> note) {
    titleController.text = note['title'];
    contentController.text = note['content'];
    editingId = note['id'];
  }

  void deleteNote(int id) async {
    await dbHelper.deleteNote(id);
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sqflite CRUD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: contentController, decoration: const InputDecoration(labelText: 'Content')),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: saveNote,
            child: Text(editingId == null ? 'Add Note' : 'Update Note'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  child: ListTile(
                    title: Text(note['title']),
                    subtitle: Text(note['content']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.edit), onPressed: () => startEdit(note)),
                        IconButton(icon: const Icon(Icons.delete), onPressed: () => deleteNote(note['id'])),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

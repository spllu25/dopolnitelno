import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notes_provider.dart';

import 'napominaniya.dart';

class ColumnListScreen extends ConsumerWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Заметки'),
      ),
      body: Column(
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            ),
            onPressed: () async {
              final newItem = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Новая заметка'),
                    content: TextField(
                      controller: textController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(textController.text);
                          textController.clear();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );

              if (newItem != null && newItem.isNotEmpty) {
                ref.read(notesProvider.notifier).add(newItem);
              }
            },
            child: Text('Добавить заметку'),
          ),
        const SizedBox(
          width: 200.0,
          height: 100.0,
        ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListViewSeparatedScreen()),
              );
            },
            child: Text('Перейти к Ежедневнику'),
          ),
          ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      ref.read(notesProvider.notifier).removeAt(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



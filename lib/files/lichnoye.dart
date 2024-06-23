import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notes_provider.dart';

class Lichnoye extends ConsumerWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lichn = ref.watch(lichnProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Личная информация'),
      ),
      body: ListView.separated(
        itemCount: lichn.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lichn[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(lichnProvider.notifier).removeAt(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить данные'),
                content:
                TextField(
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
            ref.read(lichnProvider.notifier).add(newItem);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
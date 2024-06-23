import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notes_provider.dart';

class ListViewScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Контакты'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(contactsProvider.notifier).removeAt(index);
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
                title: Text('Новый контакт'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Имя'),
                    ),
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(labelText: 'Номер'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      final name = nameController.text;
                      final number = numberController.text;
                      nameController.clear();
                      numberController.clear();
                      Navigator.of(context).pop('$name - $number');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );

          if (newItem != null && newItem.isNotEmpty) {
            ref.read(contactsProvider.notifier).add(newItem);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
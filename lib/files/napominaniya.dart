import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'lichnoye.dart';
import 'confid.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  @override
  _ListViewSeparatedScreenState createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  String textData = 'Загрузка...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://ru.wikipedia.org/api/rest_v1/page/summary/Ежедневник'));

    if (response.statusCode == 200) {
      setState(() {
        textData = json.decode(response.body)['extract'];
      });
    } else {
      setState(() {
        textData = 'Ошибка загрузки данных';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Ежедневник'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textData),
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Lichnoye()),
                  );
                },
                child: Text('Перейти к личным заметкам'),
              ),
              const SizedBox(
                width: 100.0,
                height: 200.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Confid()),
                  );
                },
                child: Text('Перейти к конфиденциальной информации'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


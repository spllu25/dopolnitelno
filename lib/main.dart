import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dopolnitelno/files/contact.dart';
import 'package:dopolnitelno/files/zametki.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Главная',
      home: ListScreens(),
      routes: {
        '/contacts': (context) => ListViewScreen(),
      },
    );
  }
}



class ListScreens extends StatefulWidget {
  @override
  _ListScreensState createState() => _ListScreensState();
}

class _ListScreensState extends State<ListScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Контактная информация'),
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                    child: CachedNetworkImage(
                        imageUrl: 'https://grizly.club/uploads/posts/2023-01/1674665556_grizly-club-p-dnevnik-klipart-36.png',
                        width: 150,
                        height: 150,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    child:CachedNetworkImage(
                        imageUrl: 'https://782329.selcdn.ru/leonardo/uploadsForSiteId/201231/texteditor/b8109cdf-f7fe-47d8-933a-b4828bd3eed0.png',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    child:CachedNetworkImage(
                        imageUrl: 'https://kartinki.pibig.info/uploads/posts/2023-03/1680239566_kartinki-pibig-info-p-napominalka-smeshnaya-kartinka-arti-6.jpg',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text('Заметки'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ColumnListScreen()));
                  },
                ),
                const SizedBox(width: 200.0, height: 50.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text('Контакты'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/contacts');
                  },
                ),
                const SizedBox(width: 100.0, height: 50.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    child:CachedNetworkImage(
                        imageUrl: 'https://vectorified.com/images/lilac-icon-24.png',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    child:CachedNetworkImage(
                        imageUrl: 'https://cont.ws/uploads/posts2/773982.jpg',
                        width: 250,
                        height: 250,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
                const SizedBox(
                  width: 100.0,
                  height: 200.0,
                ),
                Container(
                    child:CachedNetworkImage(
                        imageUrl: 'https://sc01.alicdn.com/kf/HTB1s.R9kFooBKNjSZFPq6xa2XXa8/227186619/HTB1s.R9kFooBKNjSZFPq6xa2XXa8.jpg',
                        width: 200,
                        height: 200,
                        progressIndicatorBuilder: (context,url,progress) =>const CircularProgressIndicator(),
                        errorWidget: (context,url,error) => const Center(
                            child: Icon(
                                Icons.error,
                                color: Colors.red
                            )
                        )
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
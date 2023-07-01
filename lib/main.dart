import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> dialogs = [];

  Future<void> loadJson() async {
    String jsonData = await rootBundle.loadString('assets/sample.json');
    Map<String, dynamic> data = json.decode(jsonData);
    dialogs = data['dialogs'];
  }

  void printItemDescription(String id) {
    dynamic item =
        dialogs.firstWhere((item) => item['isim'] == id, orElse: () => null);
    if (item != null) {
      String description = item['message'];
      print(description);
    }
  }

  @override
  void initState() {
    super.initState();
    loadJson().then((_) {
      printItemDescription('p2');
    });
  }

  List<String> persons = ['Eda', 'Harun', 'Ercument'];
  int personTurn = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Jsn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                printItemDescription(persons[personTurn%3]);
                personTurn++;
              },
              child: const Text("Print Description"),
            ),
          ],
        ),
      ),
    );
  }
}

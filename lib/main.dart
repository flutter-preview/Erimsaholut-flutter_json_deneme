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
      title: 'My App',
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
  List<dynamic> items = [];

  Future<void> loadJson() async {
    String jsonData = await rootBundle.loadString('assets/sample.json');
    Map<String, dynamic> data = json.decode(jsonData);
    items = data['items'];
  }

  void printItemDescription(String id) {
    dynamic item = items.firstWhere((item) => item['id'] == id, orElse: () => null);
    if (item != null) {
      String description = item['description'];
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
  @override
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
                printItemDescription('p2');
              },
              child: const Text("Print Description"),
            ),
          ],
        ),
      ),
    );
  }
}

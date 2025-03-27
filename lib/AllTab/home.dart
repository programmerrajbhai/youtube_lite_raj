import 'package:flutter/material.dart';
import 'package:youtube_lite_raj/Server.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List to hold video data
  late List<dynamic> list = [];

  Future<void> load() async {
    await Servers().FatchMyData();
    setState(() {
      list = Servers.list;  // list updated after fetching data
    });
  }

  @override
  void initState() {
    super.initState();
    load();  // Load data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final title = list[index]['snippet']['title'];  // Extract title
                  return ListTile(
                    title: Text(title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
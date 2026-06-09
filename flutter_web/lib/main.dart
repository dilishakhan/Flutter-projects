import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "Loading...";

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000'));

      setState(() {
        message = response.body;
      });
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text(message))),
    );
  }
}

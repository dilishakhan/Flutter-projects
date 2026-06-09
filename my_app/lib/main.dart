import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  print("API Key: ${Config.apiKey}");
  print("Base URL: ${Config.baseUrl}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Secrets Demo")),
        body: Center(child: Text("API Key: ${Config.apiKey}")),
      ),
    );
  }
}

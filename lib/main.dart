import 'package:flutter/material.dart';
import 'pantallas/principal.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AsiZ',
      home: PantallaPrincipal(),
    );
  }
}

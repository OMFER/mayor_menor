import 'package:flutter/material.dart';
import 'package:mayor_menor/juego_page.dart';
import 'package:mayor_menor/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListasProvider()..numGenerador(0, context) ,
      child: MaterialApp(
        title: 'Mayor que, menor que',
        home: JuegoPage(title: 'Adivine el número'),
      ),
    );
  }
}


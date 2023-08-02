import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite de Condensado'
    ],
    'Pratos Principais': ['Frango Assado com Batatas', 'Espaguete', 'Risoto'],
    'Aperitivos': ['Bolinhos de Queijo', 'Bruschetta', 'Canapés']
  };

  final String? categoriaUsuario = null;
  final String busca = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Receitas")),
          body: Column(
            children: [TextField()],
          )),
    );
  }
}

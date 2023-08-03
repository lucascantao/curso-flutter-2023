import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    'Pratos Principais': ['Frango Assado com Batatas', 'Espaguete à Bolonhesa', 'Risoto de Cogumelos'],
    'Aperitivos': ['Bolinhos de Queijo', 'Bruschetta de Tomate e Manjericão', 'Canapés de Salmão com Cream Cheese']
  };

  final String? categoriaUsuario = null;
  final String busca = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Aula de Container")),
            body: Center(
                child: Container(
              alignment: Alignment.center,
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "Um Container",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ))));
  }
}

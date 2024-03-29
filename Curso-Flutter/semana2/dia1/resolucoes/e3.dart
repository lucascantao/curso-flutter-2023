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
    'Pratos Principais': ['Frango Assado com Batatas', 'Espaguete à Bolonhesa', 'Risoto de Cogumelos'],
    'Aperitivos': ['Bolinhos de Queijo', 'Bruschetta de Tomate e Manjericão', 'Canapés de Salmão com Cream Cheese']
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Receitas")),
          body: Column(
            children: dados.entries
                .map((categoria) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                            child: Text(
                          categoria.key,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                        for (String prato in categoria.value) Text(prato)
                      ],
                    ))
                .toList(),
          )),
    );
  }
}

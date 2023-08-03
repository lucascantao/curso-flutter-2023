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
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  children: dados.entries.map((categoria) {
                return Container(
                    margin: const EdgeInsets.all(10.0),
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Text(categoria.key, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Row(
                          children: categoria.value
                              .map((prato) => Expanded(child: Text(prato)))
                              .toList(),
                        )
                      ],
                    ));
              }).toList()),
            ),
          )),
    );
  }
}

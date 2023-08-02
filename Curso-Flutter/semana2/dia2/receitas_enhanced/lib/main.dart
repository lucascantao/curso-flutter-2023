import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado'
    ],
    'Pratos Principais': [
      'Frango assado com Batatas',
      'Espaguete a Bolonhesa',
      'Risoto de Cogumelos'
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Majericão',
      'Canapés de Salmão com Cream Cheese'
    ]
  };

  runApp(MainApp(
    dados: dados,
    filtro: 1,
  ));
}

class MainApp extends StatelessWidget {
  Map<String, List<String>> dados;
  int filtro;
  MainApp(
      {super.key,
      required this.dados,
      required this.filtro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Minhas Receitas"),
            centerTitle: true,
          ),
          body:  Column(
            children: dados.entries
                .map((categoria) => Column(
                      children: [
                        Text(
                          categoria.key,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        for (String value in categoria.value)
                          Text(
                            value,
                            style: const TextStyle(fontSize: 18),
                          )
                      ],
                    ))
                .toList(),
          ),));
          
          
  }
}

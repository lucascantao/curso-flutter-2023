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
          appBar: AppBar(title: const Text("Receitas")),
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  children: dados.entries.map((categoria) {
                return Container(
                    height: 150,
                    margin: const EdgeInsets.all(10.0),
                    color: const Color.fromARGB(255, 253, 245, 220),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(categoria.key,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: categoria.value
                              .map((prato) => Flexible(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.all(5.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      height: 75,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Flexible(
                                              flex: 1,
                                              child: Icon(Icons.food_bank)),
                                          Flexible(
                                            flex: 1,
                                            child: Text(
                                              prato,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ))))
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

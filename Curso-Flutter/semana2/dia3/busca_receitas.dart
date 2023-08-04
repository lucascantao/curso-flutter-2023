import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String? categoriaUsuario = null;

  String busca = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Receitas")),
          body: Center(
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          busca = value;
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Pesquisa")),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child:
                    Cardapio(categoriaUsuario: categoriaUsuario, busca: busca),
              )
            ]),
          )),
    );
  }
}
class Cardapio extends StatefulWidget {
  final String? categoriaUsuario;
  String busca = '';

  Cardapio({super.key, required this.categoriaUsuario, required this.busca});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite de Condensado'
    ],
    'Pratos Principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelos'
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese'
    ],
    // 'Entradas': ['Petiscos de Frango', 'Salada de Boi', 'Macaxeira Frita'],
    // 'Bebidas': ['Cerveja', 'Refri', 'Suco']
  };

  @override
  Widget build(BuildContext context) {
    return Column(
        children: dados.entries.map((categoria) {
      return Container(
          height: MediaQuery.of(context).size.height / 5,
          margin: const EdgeInsets.all(1.0),
          color: const Color.fromARGB(255, 253, 245, 220),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Container(
                alignment: Alignment.center,
                child: Text(categoria.key,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: categoria.value.map((prato) {
                  if (prato
                          .toLowerCase()
                          .contains(widget.busca.toLowerCase()) ||
                      prato.isEmpty) {
                    return Flexible(
                        flex: 1,
                        child: Container(
                            margin: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                            height: 75,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Flexible(
                                    flex: 1, child: Icon(Icons.food_bank)),
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    prato,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )));
                  } else {
                    return Container();
                  }
                }).toList(),
              )
            ],
          ));
    }).toList());
  }
}

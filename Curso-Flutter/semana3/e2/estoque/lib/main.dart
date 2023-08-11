import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class Produto {
  String nome;
  String descricao;
  double preco;
  int estoque;
  Produto(
      {required this.nome,
      required this.preco,
      required this.descricao,
      required this.estoque});
}

class MainApp extends StatelessWidget {
  List<Produto> produtos = [
    Produto(
        nome: 'Açucar',
        descricao: 'Pacote açucar 1kg',
        estoque: 5,
        preco: 20.00),
    Produto(
        nome: 'Geladeira',
        preco: 4059.89,
        descricao: 'Brastemp 2001',
        estoque: 2)
  ];

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Estoque"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            children: produtos.map((produto) {
              return ItemProduto(
                  nome: produto.nome,
                  descricao: produto.descricao,
                  preco: produto.preco,
                  estoque: produto.estoque);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemProduto extends StatelessWidget {
  final String nome;
  final String descricao;
  final double preco;
  final int estoque;

  const ItemProduto(
      {super.key,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.estoque});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(5),
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 56,
                    child: Icon(Icons.shop),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text("$descricao R\$ $preco",
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey))
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 56,
                child: Text("x$estoque",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 89, 0))),
              ),
            ],
          )),
    );
  }
}
